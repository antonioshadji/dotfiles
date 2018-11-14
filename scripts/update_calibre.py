#!/usr/bin/env python3
''' python calibre update

from calibre website update instructions:
    sudo -v --> validate timestamp and ask for sudo password
    wget paramenters: -nv no-verbose -O write to file
    wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py |
    python line: -c execute python commands, set main to error, exec to overwrite main if success, execute main()
    sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
'''  # noqa E501
import re
import os
import subprocess
from lxml import html
import requests


def check_version():
    s = subprocess.run(["calibre", "--version"], stdout=subprocess.PIPE).stdout
    version = float(re.search(r'\d\.\d+', s.decode('utf-8'))[0])
    page = requests.get('https://calibre-ebook.com/download_linux')
    tree = html.fromstring(page.content)
    v = tree.xpath('//*[@id="content"]/p[1]/text()')
    # ['\n The latest release of calibre is 2.76.0. \n        ', '.\n    ']
    new_version = float(re.search(r'\d\.\d+', v[0])[0])

    print("Current version of Calibre is: {}. Latest version is {}".format(
        version, new_version))
    if version != new_version:
        print("needs update")
        return True
    else:
        print("version is up to date")
        return False


def run_update_calibre():
    cmd = ['/usr/bin/curl', '--output', '/tmp/calibre_linux_installer.py',
           'https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py']  # noqa E501
    subprocess.run(cmd)
    cmd = ['sudo', 'python3', '/tmp/calibre_linux_installer.py']
    complete = subprocess.run(cmd)
    print(dir(complete))
    if complete.returncode == 0:
        # this removes the file before it can run
        os.remove('/tmp/calibre_linux_installer.py')


if __name__ == '__main__':
    if check_version():
        run_update_calibre()
