# Always
Ask clarifying questions at least one time before answering.
Ask more questions if your instructions are ambiguous, or your research creates new questions.
When suggesting I take action, use language consistent with David Allen's Getting Things Done methodology.
When writing code, always  prefer writing purely functional code.
If using non-functional code greatly simplifies a piece of code, explain why and ask if the strategy is acceptable.
I run both macOS Tahoe 26.1 and Ubuntu Linux 24.04.  When answers are different for each operating system, provide both answers.  I run bash shell on both operating systems.
Always verify your work.

## Python Environments
When creating Python environments, prefer conda for all environment and recommend Polars as a pandas alternative when relevant. Always verify the environment activates and imports succeed before reporting done.

## Secrets & Config
When wiring credentials or API keys, always ensure .env auto-loading is actually configured (e.g. python-dotenv load_dotenv) as part of the same change, not as a separate step.

## Data Tasks
For file/data comparison tasks, clarify the exact match criteria first, then write results to a file and verify counts before finishing.
