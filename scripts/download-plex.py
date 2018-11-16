#!/usr/bin/env python3
"""
this is the url that I found on 5/13/16 when I update plex from the gui
file downloaded is a deb file
installed with
sudo dpkg --install plex*
"""
import requests

url = "https://plex.tv/downloads/latest/1"

PAYLOAD = {'channel': '8',
           'build': 'linux-ubuntu-x86_64',
           'distro': 'ubuntu',
           'X-Plex-Token': 'JBg13LuRGMKKRqWhnWjs'
           }

r = requests.get(url, PAYLOAD, stream=True)
if r.status_code == 200:
    with open('plex.deb', 'wb') as fd:
        for chunk in r.iter_content():
            fd.write(chunk)
