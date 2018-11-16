#!/usr/bin/env python3
''' python golang update '''
import re
import subprocess
from lxml import html
import requests
import shutil


def check_version():
    s = subprocess.run(["go", "version"], stdout=subprocess.PIPE).stdout
    version = float(re.findall(r'\d\.\d+', s.decode('utf-8'))[0])
    page = requests.get('https://golang.org/dl/')
    tree = html.fromstring(page.content)
    v = tree.xpath('//a[@class="download"]/@href')
    filtered_list = [x for x in v if 'linux-amd' in x]
    new_version = float(re.findall(r'\d\.\d+', filtered_list[0])[0])
    print(filtered_list[0])

    print(version, new_version)
    if version != new_version:
        print("needs update")
        return filtered_list[0]
    else:
        print("version is up to date")
        return None


def download_file(url):
    ''' download file for install '''
    r = requests.get(url, allow_redirects=True)
    # returns head & tail.  if url ends in '/' tail will be ''
    fn = url.rsplit('/', 1)[1]
    open(fn, 'wb').write(r.content)
    return fn


def extract_archive(fn, location):
    ''' extract_archive file to specified location '''
    # this will require manual entry of sudo password
    subprocess.run(["sudo", "tar", "-C", location, "-xzf", fn])


if __name__ == '__main__':
    target = check_version()
    if target:
        file_name = download_file(target)
        shutil.rmtree('/usr/local/go')
        extract_archive(file_name, '/usr/local')


# old bash version checked sha1sum
# export GOLANG_VERSION=1.5.2
# export GOLANG_DOWNLOAD_URL=https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz # noqa
# export GOLANG_DOWNLOAD_SHA1=cae87ed095e8d94a81871281d35da7829bd1234e
#
# apt-get update -qq
#
# apt-get install -y --no-install-recommends \
#     g++ \
#     gcc \
#     libc6-dev \
#     make \
#     git-core
#
# curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
#   && echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
#   && tar -C /usr/local -xzf golang.tar.gz \
#   && rm golang.tar.gz
#
# for bin in $(ls /usr/local/go/bin/); do
#   test -f /usr/bin/$bin && rm /usr/bin/$bin
#   update-alternatives --install /usr/bin/$bin $bin /usr/local/go/bin/$bin 1
#   update-alternatives --set $bin /usr/local/go/bin/$bin
# done
