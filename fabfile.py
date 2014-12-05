# !/usr/bin/env python
# -*- coding: utf-8 -*-
'''fabric functions to execute frequently used shell and ssh commands'''

import os.path

from fabric.api import run, task, hosts, sudo, put, env, roles, cd, local
from fabric.contrib import files
from fabric.context_managers import settings

env.use_ssh_config = True
env.roledefs.update({
        'ubuntu': ['localhost', 'E6400-DELL.home', 'ThinkPad-T420s.home'],
        'mac': ['Simonas-MBP.home']
        })
env.skip_bad_hosts = True

@hosts('Simonas-MBP.home')
@task
def sync_audio():
    '''
    Sync audio files from Simonas laptop to my machine
    -r, --recursive         recurse into directories
    -u, --update            skip files that are newer on the receiver
    -h, --human-readable    output numbers in a human-readable format
    --delete                delete from destination files that don't exist in
                            source
    --progress              show progress during transfer
    --stats                 print summary at end
    '''
    from_dir = '/Users/Shared/Audio-Recording Files'
    to_dir = 'antonios@antonios-linux.local:~/Audio-Recording'
    run("rsync -ruh --progress --stats '%s'/* %s" % (from_dir, to_dir))

@task
def setup_ssh_access():
    '''
    Set up access to remote machine using ssh keys
    copy ssh public key to remote machine
    https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2
    '''

@task
def push_key():
    '''
    http://bradmontgomery.blogspot.com/2009/04/push-your-ssh-public-keys-using-fabric.html
    Everything you need to push your public key to an external server using Fabric.
    '''
    keyfile = '/tmp/%s.pub' % env.user
    run('mkdir -p ~/.ssh && chmod 700 ~/.ssh')
    put('~/.ssh/id_rsa.pub', keyfile)
    run('cat %s >> ~/.ssh/authorized_keys' % keyfile)
    run('rm %s' % keyfile)

@roles('ubuntu')
@task
def update_all():
    '''
    update all software and settings on a linux machine
    '''
    sudo('apt-get update')
    sudo('apt-get upgrade -y')
    sudo('apt-get autoremove -y')
    update_dot()
    update_python()
    run('vim +PluginInstall +qall')

@task
def setup_new_machine():
    '''
    Setup new maching with:
     [X] - dotfiles
     [ ] - ssh automatic login
     [ ] - install pip if not installed
    # tutorial including how to get rid of sudo password request
    # http://awaseroot.wordpress.com/2012/04/23/fabric-tutorial-1-take-command-of-your-network/
    # sudo visudo
    # add this to end of file
    # antonios ALL=(ALL) NOPASSWD: ALL
    '''
    update_dot()
    # TODO: this requests password for private key when run on localhost
    sudo('ln -s $HOME/dotfiles/root_links/antonios.sudoers /etc/sudoers.d/10-local')

@task
def update_dot():
    '''
    login to remote machines and update dotfiles repo
    '''
    # TODO: this line is not correct, it is reading the local machine
    home = os.path.expanduser('~')
    if files.exists(home + '/dotfiles/'):
        with cd('dotfiles'):
            run('git pull github master')
    else:
        run('git clone -o github https://github.com/AntoniosHadji/dotfiles.git')

    # TODO: programmatically find .files and creat symlinks for all
     # find . -maxdepth 2 -type f -name '.*'
     #install_dotfiles () {
     # info 'installing dotfiles'

     # local overwrite_all=false backup_all=false skip_all=false

     # for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
     # do
     #   dst="$HOME/.$(basename "${src%.*}")"
     #   link_file "$src" "$dst"
     # done
    run('ln -sf dotfiles/.bash_profile .')
    run('ln -sf dotfiles/.bash_rc .')
    run('ln -sf dotfiles/.gitconfig .')
    run('ln -sf dotfiles/.dircolors .')
    run('ln -sf dotfiles/.vimrc .')
    run('ln -sf dotfiles/.vim .')
    run('ln -sf dotfiles/.vimrc.plugins .')
    run('ln -sf dotfiles/.vimrc.bundles .')
    run('ln -sf dotfiles/.curlrc .')
    run('ln -sf dotfiles/.tmux.conf .')
    run('ln -sf dotfiles/.fonts .')
    # TODO: test if this line is correct and is reading the local machine
    home = run('echo $HOME')
    run('ln -sf dotfiles/defaults.list ' + home + '/.local/share/applications/.')

@task
def install_vundle():
    '''
    setup vundle for first use
    '''
    # TODO: this line is not correct, it is reading the local machine
    home = os.path.expanduser('~')
    with cd('dotfiles'):
        if not files.exists('.vim/bundle/vundle'):
            run('mkdir -p .vim/bundle')
        repo = 'https://github.com/gmarik/Vundle.vim.git'
        target = home + '/dotfiles/.vim/bundle/vundle'
        run('git clone ' + repo + ' ' + target)

@task
def update_python():
    '''
    update python environment
    '''
    # TODO: must verify install of pip and install if neccassary
    # this breaks the run
    dotfile = '/dotfiles/requirements.txt'
    # TODO: this line is not correct, it is reading the local machine
    home = os.path.expanduser('~')
    if files.exists(home + dotfile):
        sudo('pip install -U -r ' + home + dotfile)

# from https://stackoverflow.com/questions/14904560/in-fabric-how-can-i-check-if-a-debian-or-ubuntu-package-exists-and-install-it-i
# functions to test if program installed
def package_installed(pkg_name):
    """ref: http:superuser.com/questions/427318/#comment490784_427339"""
    cmd_f = 'dpkg-query -l "%s" | grep -q ^.i'
    cmd = cmd_f % (pkg_name)
    with settings(warn_only=True):
        result = run(cmd)
    return result.succeeded

def yes_install(pkg_name):
    """ref: http://stackoverflow.com/a/10439058/1093087"""
    run('apt-get --force-yes --yes install %s' % (pkg_name))

def make_sure_memcached_is_installed_and_running():
    if not package_installed('memcached'):
        yes_install('memcached')
    with settings(warn_only=True):
        run('/etc/init.d/memcached restart', pty=False)

@hosts('localhost')
@task
def screen():
    result = local('gsettings get org.gnome.desktop.session idle-delay')
    if result == 'uint32 600\n':
        local('gsettings set org.gnome.desktop.session idle-delay 0')
        print("no screen blank")
    else:
        local('gsettings set org.gnome.desktop.session idle-delay 600')
        print("10 minute screen blank")
