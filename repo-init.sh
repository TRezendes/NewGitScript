#!/bin/zsh

# Loop until all parameters are used up
copy_css=0
copy_robots=0
while [ "$1" != "" ]; do
    if [ $1 = "-t" -o $1 = "--type" ]
    then
        case $2 in
            html | css )
                copy_css=1
                if $2 = "html"
                then
                    copy_robots=1
                fi
                shift
                ;;
            python )
                shift
                ;;
            * )
                echo "Unkown project type"
                shift
        esac
        shift
    fi

    git init $1
    cp /Users/trezendes/Projects/default.gitignore $1/.gitignore
    if [ "$copy_css" -eq 1 ]
    then
        cp /Users/trezendes/Projects/default.css $1/default.css
    fi
    if [ "$copy_robots" -eq 1 ]
    then
        cp /Users/trezendes/Projects/robots.txt $1/robots.txt
    fi
    shift
done



