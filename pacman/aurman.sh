#!/bin/bash
# region constants

r="\033[1;31m"
g="\033[1;32m"
n="\033[0;39m"

function faulty
{
    echo -e "$r!> $1$n"
}

function region
{
    echo -e "$g=> $1$n"
}

# endregion
# region help

if echo $1 | grep -q "h" || [ $# -ne 2 ]
then
    echo "Simplifies work with AUR, Git and makepkg"
    echo ""
    echo "Usage: aurman <operations> <repository>"
    echo "Operations:"
    echo "    -h display this text"
    echo "    -s synchronize repository aka fetch & pull"
    echo "    -i make & install the package"
    echo "    -c clean repository"
    exit 0
fi

# endregion
# region check

cd $2

if echo $1 | grep -qE "s|c"
then
    git rev-parse --is-inside-work-tree &> /dev/null

    if [ $? -ne 0 ]
    then
        faulty "Couldn't find a repository in the given directory"
        exit 1
    fi
fi

# endregion
# region sync

if echo $1 | grep -q "s"
then
    region "Synchronizing repository..."

    git fetch -q

    if [ $? -ne 0 ]
    then
        faulty "Couldn't fetch changes from the remote repository"
        exit 1
    fi

    if [ $(git rev-parse HEAD) == $(git rev-parse FETCH_HEAD) ]
    then
        echo "No changes have been found in the remote repository"
        exit 0
    fi

    git pull -q

    if [ $? -ne 0 ]
    then
        faulty "Couldn't pull changes *clueless*"
        exit 1
    fi
fi

# endregion
# region make

if echo $1 | grep -q "i"
then
    region "Making a package..."
    makepkg -sicrf
fi

# endregion
# region clean

if echo $1 | grep -q "c"
then
    region "Cleaning repository..."
    git clean -df
fi

# endregion
