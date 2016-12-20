
##
# Your previous /Users/MTGAP/.bash_profile file was backed up as /Users/MTGAP/.bash_profile.macports-saved_2010-01-06_at_08:05:34
##

# MacPorts Installer addition on 2010-01-06_at_08:05:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/usr/local/ActivePerl-5.12/bin:$PATH
export PATH=/usr/local/ActivePerl-5.12/site/bin:$PATH

export PATH=~/play-1.1.1:$PATH

##
# Your previous /Users/MTGAP/.bash_profile file was backed up as /Users/MTGAP/.bash_profile.macports-saved_2011-08-30_at_17:43:42
##

# MacPorts Installer addition on 2011-08-30_at_17:43:42: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/MTGAP/.bash_profile file was backed up as /Users/MTGAP/.bash_profile.macports-saved_2013-01-26_at_16:23:23
##

# PATH for Racket
export PATH=/Applications/Racket\ v5.3.5/bin:$PATH

# PATH for various scripts
# Note: the :$PATH part means "append the current PATH to this
# value". You have to do this or else the previous PATH will disappear.
export PATH=/Users/MTGAP/programs/scripts:$PATH

export PATH=/usr/local/bin/go:$PATH
export PATH=/usr/local/lib/python2.7/site-packages:$PATH

# Fix Homebrew
export MACOS=69

# PATH
export PATH=/usr/local/bin:$PATH

# export PYTHONPATH=/usr/local/lib/python2.7:$PYTHONPATH

# Shared library path for PostgreSQL
LD_LIBRARY_PATH=/usr/local/pgsql/lib
export LD_LIBRARY_PATH

# Load Sourcegraph config
# Must be done before GOPATH
source $HOME/.sourcegraph/config

# Set GIT_HTTP_BACKEND for sourcegraph/vcsserver
# https://github.com/sourcegraph/vcsserver
# TODO: No idea if this is right
export GIT_HTTP_BACKEND=/usr/local/bin/git

# GOPATH
export GOPATH=$SG_HOME/Godeps/_workspace
export GOPATH=$HOME/programs/go:$GOPATH

# PATH for Go installs
export PATH=/usr/local/go/bin:$GOPATH/bin:$HOME/programs/go/bin:$PATH

# PostgreSQL config
LD_LIBRARY_PATH=/usr/local/Cellar/postgresql/9.3.2/lib
export LD_LIBRARY_PATH

# Add PostgreSQL to path
export PATH=/usr/local/Cellar/postgresql/9.3.2/bin:$PATH

# Modifications to make iTerm work
bind '"M-d": backward-kill-word'
bind '"M-b": backward-word'
bind '"M-f": forward-word'

# Added by Canopy installer on 2013-10-06
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
# VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/MTGAP/Library/Enthought/Canopy_64bit/User/bin/activate

test -r /sw2/bin/init.sh && . /sw2/bin/init.sh

# Shortcuts

alias gs="git status"
alias gc="git commit -am"

# Add GNU m4
export PATH=/sw2/bin:$PATH

# added by Anaconda 2.1.0 installer
export PATH="/Users/MTGAP/anaconda/bin:$PATH"

# OPAM configuration
. /Users/MTGAP/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# added by Anaconda 2.2.0 installer
export PATH="/Users/MTGAP/anaconda/bin:$PATH"

##
# Your previous /Users/MTGAP/.bash_profile file was backed up as /Users/MTGAP/.bash_profile.macports-saved_2015-10-22_at_11:12:33
##

# MacPorts Installer addition on 2015-10-22_at_11:12:33: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Tex executables
export PATH=/Library/Tex/texbin:$PATH

# Homebrew
export PATH=/usr/local/Cellar/:$PATH

# To get IPython Notebook working
# see http://stackoverflow.com/questions/15526996/ipython-notebook-locale-error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# added by Anaconda2 4.0.0 installer
export PATH="/Users/MTGAP/anaconda/bin:$PATH"

##
# Your previous /Users/MTGAP/.bash_profile file was backed up as /Users/MTGAP/.bash_profile.macports-saved_2016-06-03_at_20:48:36
##

# MacPorts Installer addition on 2016-06-03_at_20:48:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -e /Users/MTGAP/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/MTGAP/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
