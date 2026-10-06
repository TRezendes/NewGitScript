#!/bin/zsh

# Initialize variables
## repo "types" accepted by this command
known_types=(css html python r)
exit_code=0
error_message=""
help_text="Repo Initializer
Initializes a new git repository with some default files to get you started
Always adds ./default.gitignore as <repository name>/.gitignore
Can also add other default files based on the -t | --type option

Usage:
    repo-init [options] <repository name>

Options:
    -h --help               Show this help and exit
    -t --type <repo type>   Specify the repository's main code type
      (may be used multiple times)

        Known Types (not case sensitive):
            CSS     Adds ./default.css as <repository name>/default.css
            HTML    Adds ./default.css as <repository name>/default.css
                and ./default_robots.txt as <repository name>/robots.txt
            python  Does not add any defaults at this time
            r       Does not add any defaults at this time
"

types=()
repo_name=
help_requested=false
exit_code=0
while (($#)); do
  if [[ $1 == --*=* ]]; then
    argv[1]=("${1%%=*}" "${1#*=}")
  fi
  case $1 in
    -t | --type)
      shift
      types+=$1
      shift;;
    -h | --help)
      help_requested=true
      shift;;
    -*)
      error_message="Invalid flag: $1

      "
      help_requested=true
      exit_code=1
      echo "$error_message$help_text"
      exit $exit_code;;
    *)
      repo_name=$1
      shift;;
  esac
done

echo $repo_name

# If the repo name is omitted, display an error and the help message
if [ ${#repo_name} -eq 0 -a $help_requested != true ]
then
  help_requested=true
  exit_code=1
  error_message="Error: Repository Name is required

"
fi

if $help_requested; then
  echo "$error_message$help_text"
  exit $exit_code
fi

if [ ${#types} -gt 0 ]; then
  for i in $types; do
    if [[ ${known_types[(r)$i]} ]]; then
      case $i in
        html | css )
          copy_css=$((copy_css+1))
          if [[ $i == "html" ]]; then
            copy_robots=$((copy_robots+1))
          fi
        ;;
        python | r )
        ;;
        * )
        ;;
      esac
    fi
  done
fi

# git init $1
echo "git init $1"
cp /Users/trezendes/Projects/default.gitignore $1/.gitignore
# echo "cp /Users/trezendes/Projects/default.gitignore $repo_name/.gitignore"
if [ $((copy_css)) -gt 0 ]; then
  cp /Users/trezendes/Projects/default.css $1/default.css
  # echo "cp /Users/trezendes/Projects/default.css $repo_name/default.css"
fi
if [ $((copy_robots)) -gt 0 ]; then
  cp /Users/trezendes/Projects/robots.txt $1/robots.txt
  # echo "cp /Users/trezendes/Projects/robots.txt $repo_name/robots.txt"
fi

exit $exit_code
