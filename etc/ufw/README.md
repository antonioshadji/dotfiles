# Step 1: Check if UFW is currently enabled (should show "inactive")
sudo ufw status

# Step 2: Allow all traffic from your local IPv4 subnet
sudo ufw allow from 10.0.0.0/24

# Step 3: Allow all traffic from IPv6 link-local addresses
sudo ufw allow from fe80::/10

# Step 4: Review the rules before enabling
sudo ufw show added

# Step 5: Enable UFW (you'll get a warning about SSH - type 'y')
sudo ufw enable

# Step 6: Verify the rules are active
sudo ufw status numbered
sudo ufw status verbose

# Step 7: Test SSH from another terminal
# Open a NEW terminal window and try: ssh user@10.0.0.99
# Don't close your current session until the new connection works!

# Step 8: Start JupyterLab
jupyter lab --ip='*'

## Expected output from `sudo ufw status numbered`:
Status: active

     To                         Action      From
     --                         ------      ----
[ 1] Anywhere                   ALLOW IN    10.0.0.0/24
[ 2] Anywhere                   ALLOW IN    fe80::/10
[ 3] Anywhere (v6)              ALLOW IN    fe80::/10

## Main configuration files

```
/etc/ufw/
├── ufw.conf           # Main UFW settings (enabled/disabled)
├── before.rules       # Rules processed before user rules (IPv4)
├── before6.rules      # Rules processed before user rules (IPv6)
├── after.rules        # Rules processed after user rules (IPv4)
├── after6.rules       # Rules processed after user rules (IPv6)
├── user.rules         # Your rules (IPv4) - THIS IS WHAT YOU WANT
├── user6.rules        # Your rules (IPv6) - THIS IS WHAT YOU WANT
└── applications.d/    # Application profiles
```
