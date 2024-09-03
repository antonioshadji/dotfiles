#!/usr/bin/env bash
# installs git and other dev tools
xcode-select --install

# git clone dotfiles to .config/dotfiles

# install docker desktop for mac
# https://www.docker.com/products/docker-desktop/

# install latest python3 - replace with anaconda distribution
# sudo port install python312
# sudo port select --set python3 python312
# sudo port install py312-pip

# install neovim
sudo port install neovim
sudo port install lua-language-server  # note shows cmd required in config
sudo port install pyright typescript-language-server ruff

# install tools
sudo port install tmux
sudo port install fd ripgrep
sudo port install jq

# install node
sudo port install nodejs22
sudo port install npm10
sudo port install yarn


#   yarn has the following notes:
#     yarn stores data in:
# 
#         ~/.yarn
#         ~/.yarnrc
#         ~/.cache/yarn
#         ~/.config/yarn
# 
#     Should you choose to install packages globally with yarn (yarn global add), these files will not
#     be removed if you deactivate or uninstall yarn. By default, these packages will be installed in
#     ~/.config/yarn/global, and soft-linked to /opt/local/bin. To uninstall them all:
# 
#     $ ls -1 $HOME/.config/yarn/global/node_modules/  | xargs sudo yarn global remove
# 
#     You may then remove the directories listed above and uninstall yarn.
# 
#     yarn is meant to replace NPM, and may cause conflicts if you use both.
# 
#     You may override the default global installation directory by setting the PREFIX environment
#     variable, e.g.
# 
#     mkdir -p $HOME/.config/yarn/bin # Or wherever you want
#     export PREFIX=$HOME/.config/yarn/bin
#     export PATH=$PREFIX:$PATH
# # note: globally installed packages remain in /opt/local/lib/node_modules until manually deleted

# layer2
# sudo port install cloudflared
# --->  Some of the ports you installed have notes:
#   cloudflared has the following notes:
#     The automatically created startup item configures cloudflared as a DNS over HTTPS client using
#     cloudflare DNS, running on port 5053. If you want to use cloudflared for other stuff please
#     create your own launchd script. Since version 2022.12.0, due to changes in the software, a
#     sample configuration file is no longer provided.
# 
#     A startup item has been generated that will aid in starting cloudflared with launchd. It is
#     disabled by default. Execute the following command to start it, and to cause it to launch at
#     startup:
# 
#         sudo port load cloudflared


sudo port install pandoc +texlive
#   cabal has the following notes:
#     The Cabal User Guide is available at:
# 
# 
#     file:///opt/local/share/doc/cabal-3.10.3.0/users-guide/index.html
#   ghc has the following notes:
#     The GHC User Manual is available at:
# 
# 
#     file:///opt/local/share/doc/ghc-9.6.4/html/index.html
# 
#     /opt/local/share/doc/ghc-9.6.4/users_guide.pdf
# 
#     Copy/edit /opt/local/etc/ghci.conf to your
#     directory ~/.ghc
#     for a user-specific startup configuration.
#   grep has the following notes:
#     This port previously installed itself without a
#     g* prefix, thus overshadowing system binaries
#     such as grep, fgrep, and egrep. The port is now
#     changed so that it does install with a g*
#     prefix, like other GNU ports. This means that
#     you'll now find GNU grep at
#     /opt/local/bin/ggrep. If you dislike typing
#     ggrep, you can create a shell alias or you can
#     add /opt/local/libexec/gnubin to your PATH,
#     wherein non-g* prefixed symlinks are installed.
#     In other words, /opt/local/libexec/gnubin
#     contains GNU binaries without any prefix to the
#     file names, so you can type grep and get GNU
#     grep just as before.
#   openldap has the following notes:
#     A startup item has been generated that will aid
#     in starting openldap with launchd. It is
#     disabled by default. Execute the following
#     command to start it, and to cause it to launch
#     at startup:
# 
#         sudo port load openldap
#   pandoc has the following notes:
#     pandoc uses LaTeX to create PDFs.
# 
#     The (minimized) variant +texlive uses MacPorts
#     TeXLive.
# 
#     For full LaTeX PDF support, please use the
#     variant +full_latex_dependencies.
#   wget has the following notes:
#     To customize wget, you can copy
#     /opt/local/etc/wgetrc.sample to
#     /opt/local/etc/wgetrc and then make changes.
