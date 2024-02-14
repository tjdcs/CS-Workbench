#!zsh

LAST_WD=$(pwd)

git config --global submodule.recurse true

cd /workspaces/DevContainer
git init

if [[ ! -d colour ]]; then
    git submodule add -b develop https://github.com/colour-science/colour.git
    git submodule init
fi

if [[ ! -d colour-datasets ]]; then
    git submodule add -b develop https://github.com/colour-science/colour-datasets.git
    git submodule init
fi

if [[ ! -d colour-specio ]]; then
    git submodule add -b main https://github.com/colour-science/colour-specio.git
    git submodule init
fi

cd $LAST_WD