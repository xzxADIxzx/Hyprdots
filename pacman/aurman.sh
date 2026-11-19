#!/bin/bash
# region logs

function region
{
    [[ -z $quiet ]] && echo -e "\e[1;32m => $1 \e[0;39m"
}

function common
{
    [[ -z $quiet ]] && echo -e "\e[1;34m << $1 \e[0;39m"
}

function faulty
{
    [[ -z $quiet ]] && echo -e "\e[1;31m !! $1 \e[0;39m"
}

# endregion
# region help

if [[ $1 == *h* || $# == 0 ]]
then
    echo "Simplifies work with AUR, git and makepkg"
    echo ""
    echo "Usage: aurman <operations> [repository]"
    echo "Operations:"
    echo "    -h display this text"
    echo "    -s synchronize repository aka fetch & pull"
    echo "    -i make & install the package"
    echo "    -c clean repository"
    exit 0
fi

# endregion
# region repo

[[ ! -z $2 ]] && cd $2

if [[ $1 == *s* || $1 == *c* ]]
then
    if ! git rev-parse --is-inside-work-tree &> /dev/null
    then
        faulty "Couldn't find a repository in the given directory"
        exit 1
    fi
fi

# endregion
# region sync

if [[ $1 == *s* ]]
then
    region "Synchronizing repository..."

    if ! git fetch -q
    then
        faulty "Couldn't fetch changes from the remote repository"
        exit 1
    fi

    if [[ $(git rev-parse HEAD) == $(git rev-parse FETCH_HEAD) ]]
    then
        common "No changes have been found in the remote repository"
        exit 0
    fi

    if ! git pull -q
    then
        faulty "Couldn't pull changes *clueless*"
        exit 1
    fi
fi

# endregion
# region make

if [[ $1 == *i* ]]
then
    region "Making a package..."
    makepkg -sicrf
fi

# endregion
# region clean

if [[ $1 == *c* ]]
then
    region "Cleaning repository..."
    git clean -df
fi

# endregion
