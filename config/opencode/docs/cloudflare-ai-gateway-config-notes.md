# Review notes — Cloudflare AI Gateway config in `~/.config/opencode`

Review dates: 2026-11-07/08 · OpenCode v2.2.6 · Files reviewed: `opencode.jsonc`, `cli.json`, `.env`

## Outcome

✅ **Working end-to-end as of 2026-11-08:**

```
opencode run -m cloudflare/router "Reply with exactly: OK"
> build · router
OK
```

The `cloudflare/router` model → `dynamic/leros_router` dynamic route → AI Gateway `default` → BYOK provider
(verified: response `cf-aig-model: grok-4.7`, `cf-aig-provider: grok`).

## What was wrong and what was fixed

### 1. Deprecated + broken provider block (fixed in `opencode.jsonc`)
- The original used the **deprecated v1 `"provider"` schema**, whose fields are `options` (`apiKey`/`baseURL`)
  and `npm`. The file used `settings`, so `baseURL`, `apiKey`, and `headers` were silently ignored. Error:
  `Cannot initialize cloudflare/router: Route.model(openai-compatible-chat) requires an endpoint baseURL`.
- Fix: migrated to the v2 `"providers"` shape with `package: "@opencode/ai/providers/openai-compatible"`,
  `settings`, and top-level provider-level `headers`. Runtime packages: `@ai-sdk/openai-compatible` =
  v1 `npm` key; `@opencode/ai/providers/openai-compatible` = v2 `package` key.

### 2. Dead stored credentials (root cause of all "Authentication error" failures)
- OpenCode keeps credentials in its internal store (`opencode.db`) and **stored credentials take precedence
  over `env` vars and `settings.apiKey`** (proven by header-capture: OpenCode sent a stale `cfoat_…` token,
  not the token from `.env`).
- Two stored Cloudflare credentials existed ("Cloudflare AI Gateway", integration `cloudflare-ai-gateway`;
  and "Cloudflare AI Gateway Leros", integration `cloudflare`). Both were **dead (HTTP 401 on all endpoints)**.
- Fix applied via the sanctioned flow:
  1. `opencode auth export` → JSON
  2. replace `value.key` in both entries with the working gateway token (`cfut_…` from `.env`)
  3. `opencode auth logout cloudflare <cred_id>` / `opencode auth logout cloudflare-ai-gateway <cred_id>`
  4. `opencode auth import <file>`
- Verified: `Authorization: Bearer cfut_…` + `cf-aig-gateway-id: default` are now what OpenCode sends.
- Note: `opencode auth login cloudflare --method key --answer field=…` could not be used non-interactively —
  the form-field name is not discoverable via CLI (checked field names `key`, `apiKey`, `token`, `apiToken`,
  `gatewayToken`, etc. — all rejected as "Unknown form field"). Export/import was used instead.

### 3. Endpoint choice (verified against live Cloudflare)
| Test | Result |
|---|---|
| REST API `https://api.cloudflare.com/client/v4/accounts/{acct}/ai/v1/chat/completions` + `cf-aig-gateway-id: default`, model `dynamic/leros_router`, `Authorization: Bearer` token | ✅ 200 |
| Gateway host `https://gateway.ai.cloudflare.com/v1/{acct}/{gw}/compat/chat/completions`, same model, `Authorization` or `cf-aig-authorization` header | ✅ 200 — auth works via either header on this host |
| Documented Auto Router model `cloudflare/auto` (both hosts) | ❌ 402 — "Insufficient unified billing credits" |

- Chosen config uses the **REST API endpoint** (Cloudflare's recommendation for new integrations) with
  `Authorization: Bearer` (what `apiKey` produces) and the required `cf-aig-gateway-id: default` header
  (gateway not in the URL path → must name it explicitly for dynamic routes).
- **`dynamic/leros_router` is correct today** — a real dynamic route on gateway `default` backed by BYOK keys.
  "Leros" appears nowhere in Cloudflare public docs/blog (internal codename); the documented built-in smart
  router is **`cloudflare/auto`**.
- Session affinity (`cf-aig-session-id` for prompt-cache reuse) is sent by OpenCode automatically.

### 4. Other config fixes applied (`opencode.jsonc`)
- `experimental.policies` → top-level `"policies"` (current location).
- `permissions`: moved the `rm -rf *` deny rule before the `shell *` allow rule (ordered ruleset; only matches
  that literal text, not `rm -rf /` variants).
- Deleted the dead commented v1 `cloudflare-auto-gateway` block.
- `env` list trimmed to the credential var `CLOUDFLARE_API_TOKEN` (interpolation of the other vars in
  `baseURL` works regardless).
- Plugin `@cloudflare/aig-opencode-plugin` was already configured and auto-installed by OpenCode into
  `~/.cache/opencode/npm/…` (confirmed loaded in logs); `opencode plugin add` reports it as already present.

## Remaining items (user action required)

1. **Rotate the plaintext secrets.** The gateway token and a live-looking Vercel API key sit in plaintext in
   `~/.config/opencode/.env` and `provider-example-api.jsonc` (both chmod 600). The gateway token has now been
   imported into OpenCode's credential store — after rotating, update `.env` and re-run the export/import fix.
   Recommend deleting `provider-example-api.jsonc`.
2. **Unified Billing credits** if switching to the documented `cloudflare/auto` Auto Router or the built-in
   `cloudflare-ai-gateway/*` catalog models — they resolve via Unified Billing on the account, and requests
   currently return 402. After funding, either set `modelID` to `cloudflare/auto` on the `router` model or
   pick any `cloudflare-ai-gateway/…` model.
3. Small fixes available in `cli.json` — none required; `session.permissions: autoaccept` combined with the
   allow-all `permissions` ruleset means effectively no approval prompts (with secrets on disk, worth knowing).

## Resolution 2: env-var dependency removed (2026-11-08, post-restart)

After a restart, `opencode run` (background service) reproduced
`Error: Could not route to /client/v4/accounts/ai/v1/chat/completions`.
Cause: `{env:CLOUDFLARE_ACCOUNT_ID}` interpolated to empty — the background service process had no
`CLOUDFLARE_ACCOUNT_ID` in its environment (`.env` is not auto-loaded into the daemon, and the shell profile
did not export it).

Fix applied: the **account ID is hardcoded** in `settings.baseURL`
(`https://api.cloudflare.com/client/v4/accounts/9caf9558d9e72b1bce15c5490c934243/ai/v1`). The account ID is
an identifier, not a secret, so this is safe, and it makes the config independent of daemon env vars. The
gateway ID was already hardcoded (`cf-aig-gateway-id: default`), and auth comes from the credential store, not
env. The entries in `~/.config/opencode/.env` are now optional for this provider.

Verified under the original failure conditions (background service, no env sourced):

```
opencode run -m cloudflare/router "Reply with exactly: OK"
> build · router
OK
```

Side effect to know: with account/gateway hardcoded and auth in the credential store, requests authenticate
and resolve even when no Cloudflare env vars are set. If the account is ever changed, update the URL and the
stored credential (`opencode auth export` → edit → `auth logout` → `auth import`).

## Reference

- Auto Router: <https://developers.cloudflare.com/ai-gateway/features/auto-router/>
- Dynamic route usage: <https://developers.cloudflare.com/ai-gateway/features/dynamic-routing/usage/>
- Authenticated Gateway: <https://developers.cloudflare.com/ai-gateway/configuration/authentication/>
- OpenCode integration (v1 shape): <https://developers.cloudflare.com/ai-gateway/integrations/coding-agents/opencode/>
- OpenCode v2 providers (`providers`/`settings`/`package`, `{env:VAR}`): <https://opencode.ai/docs/providers/>
- OpenCode v2.2.6 built-in provider: `cloudflare-ai-gateway` (auto-activates on
  `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` + `CLOUDFLARE_GATEWAY_ID`; catalog from models.dev).
