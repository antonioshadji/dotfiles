#!/usr/bin/env python3
"""
https://docs.ansible.com/ansible/2.7/user_guide/playbooks_best_practices.html#content-organization

roles/
    common/               # this hierarchy represents a "role"
        tasks/            #
            main.yml      #  <-- tasks file can include other files
        handlers/         #
            main.yml      #  <-- handlers file
        templates/        #  <-- files for use with the template resource
            ntp.conf.j2   #  <------- templates end in .j2
        files/            #
            bar.txt       #  <-- files for use with the copy resource
            foo.sh        #  <-- script files for use with the script resource
        vars/             #
            main.yml      #  <-- variables associated with this role
        defaults/         #
            main.yml      #  <-- default lower priority variables for this role
        meta/             #
            main.yml      #  <-- role dependencies
        library/          # roles can also include custom modules
        module_utils/     # roles can also include custom module_utils
        lookup_plugins/   # or other types of plugins, like lookup in this case
"""

import sys
from pathlib import Path

if len(sys.argv) == 1:
    print("must supply name for new role")
    sys.exit(1)
else:
    role_name = sys.argv[1]

dir_list = [
    "tasks",
    "handlers",
    "templates",
    "files",
    "vars",
    "defaults",
    "meta",
]

extra = ["library", "module_utils", "lookup_plugins"]

files_list = [
    "tasks",
    "handlers",
    "vars",
    "defaults",
    "meta",
]

for d in dir_list:
    p = "roles/{}/{}".format(role_name, d)
    Path(p).mkdir(parents=True, exist_ok=True)
    if d in files_list:
        with open(f"{p}/main.yml", "w") as f:
            f.write("---")
