Conversion of configuration to ansible
=======================================

**WHY:**
- Getting a new machine ready for use with familiar tools is important.
- Configuration should only need to be done once
- Configuration will be improved over time
- Keep DRY

**TODO:**
[ ] install configuration files for vim

**DONE:**
[x] install vim for machines using package manager vim


**NOTES:**
`ansible-inventory -i file --list` will inspect and report defects in inventory
files. This tool outputs json.  JSON is valid YAML, YAML is not JSON.
*Inventory file does not work as JSON. Open Question?*

Create groups to streamline application of roles to multiple machines.
If not, ansible executes entire process on each machine separately.


