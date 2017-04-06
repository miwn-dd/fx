#!/bin/bash

# update aliases
alias uba='curl -s https://raw.githubusercontent.com/miwn-dd/fx/master/.bash_aliases > ~/.bash_aliases && source ~/.bash_aliases'

# paths
PATH_GITHUB=$HOME/projects/github
alias to_gh="cd ${PATH_GITHUB}"
export PATH=$PATH:$HOME/.composer/vendor/bin/

# list files
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# docker
alias d="docker"
alias dcc="docker ps -a --no-trunc | grep 'Exit' | awk '{print \$1}' | xargs -r docker rm"
alias dccc="docker ps -a --no-trunc | grep 'Created' | awk '{print \$1}' | xargs -r docker rm"
alias dci="docker images --no-trunc | grep none | awk '{print \$3}' | xargs -r docker rmi"
dci_grep() {
    docker images --no-trunc | grep $1 | awk '{print $3}' | xargs -r docker rmi
}
alias di="docker images"
alias dps="docker ps -a"
alias dcp="docker-compose"
# docker destroy all
dda() {
    # Stop all containers
    docker stop $(docker ps -a -q)
    # Delete all containers
    docker rm $(docker ps -a -q)
    # Delete all images
    docker rmi $(docker images -q)
}

# docker machine
alias dm="docker-machine"
alias dml="docker-machine ls"
alias dms="docker-machine ssh"
dms2() {
    docker-machine ssh $1 "curl -s https://raw.githubusercontent.com/miwn-dd/fx/master/.bash_aliases >> ~/.bash_aliases" $1
    docker-machine ssh $1 "echo '. .bash_aliases' >> ~/.bashrc" $1
}

# pip
alias pf="pip freeze"
alias pfg="pip freeze | grep -i"
alias pu="pip uninstall"
alias pi="pip install"
#alias pc="pip freeze -l | grep -v distribute | grep -v git+git | xargs pip uninstall -y"
alias pc="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 -P10 pip uninstall -y"

# python
alias p="python"
alias p2="python2"
alias p3="python3"
alias pm="python manage.py"
alias pmr="pm runserver 0.0.0.0:8000"
alias pms="pm shell"
alias pmcs="pm collectstatic --noinput"
alias pmsdb="pm syncdb --noinput"
alias pmmig="pm migrate --all"
alias pmcs="pm collectstatic --noinput"
alias pmmin="pm minify --all"
alias pmmig="pm migrate --all"

# python packages
alias rvld="restview --long-description --pypi-strict"

# git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcod="git checkout development"
alias gd="git diff"
alias gl="git lg"
alias gm="git merge"
alias gf="git fetch"
alias gpl="git pull --ff"
alias gp="git push"
alias gs="git status"
alias gsta="git stash"
alias gstap="git stash pop"
alias gpushom="git push origin master"
alias gpullom="git pull origin master"
alias gcm="git commit -m "
alias gcms="git commit -S -m"
alias glr="git rev-parse --verify HEAD"
alias gpso="git push origin"
alias gplo="git pull origin"
alias gpt="git push origin --tags"
alias gpd="git pull origin development"
alias gpsd="git push origin development"
# does not work as evaluated on run time
#alias gpsoc="git push origin $(git rev-parse --abbrev-ref HEAD)"
#alias gploc="git pull origin $(git rev-parse --abbrev-ref HEAD)"
alias gb="git branch -a"
alias gifm="git config core.fileMode false"
alias gfo="git fetch origin"
alias git_initial="touch .gitignore && git add .gitignore && git commit -m 'initial commit' && git branch -m master development && git push origin development"
g2d() {
    git checkout development
    git pull origin development
    git remote prune origin
    git branch -d $1
}
gsw() {
    git checkout $1
    git pull origin $1
}
git_retag() {
    git tag -d $1 && git push origin --delete $1 && git tag $1 && git push origin --tags
}
git_remove_all_tags() {
    git tag | xargs git push origin --delete && git tag | xargs git tag -d
}

# virtualenv
alias da="deactivate"
alias ae=". .env/bin/activate"

# vagrant
#alias vu="vagrant up"
vu() {
    vagrant up $1
    vagrant ssh -c "curl -s https://raw.githubusercontent.com/miwn-dd/fx/master/.bash_aliases >> ~/.bash_aliases" $1
}
vu2() {
    vagrant up $1
    vagrant ssh -c "curl -s https://raw.githubusercontent.com/miwn-dd/fx/master/.bash_aliases >> ~/.bash_aliases" $1
    vagrant ssh -c "echo '. .bash_aliases' >> ~/.bashrc" $1
}
alias vs="vagrant ssh"
alias vd="vagrant destroy"
alias vr="vagrant reload"
alias vst="vagrant status"
alias vh="vagrant halt"

# services
alias donph="sudo service nginx start && sudo service mysql start && sudo service php5-fpm start"
alias dofph="sudo service nginx stop && sudo service mysql stop && sudo service php5-fpm stop"
alias donpy="sudo service postgresql start && sudo service redis-server start"
alias dofpy="sudo service postgresql stop && sudo service redis-server stop"
alias nginx_re="sudo service nginx restart"

# openssl
alias ssh_key="ssh-keygen -t rsa -b 8192"
alias ssl_key="openssl genrsa 4096"
alias ssl_key_rand="openssl dhparam -rand - 2048 >> "
alias ssl_csr="openssl req -new -sha256 -key"
alias ssl_cert="openssl x509 -sha256 -req -days 3000 -in domain.csr -signkey key.pem -out"

#########################
# Misc
#########################
alias ls="ls -l"

#########################
# CD BACKSLASH SHORTHAND
#########################
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias dev='cd /cygdrive/c/Develop'
