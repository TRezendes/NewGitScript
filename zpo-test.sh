#!/bin/zsh

known_types=(css html python r)
copy_css=0
copy_robots=0

zparseopts -a repo_name_array -D t+:=type -type+:=type h=help_requested -help=help_requested repo_name_scalar
#
# echo $repo_name_array
# echo $repo_name_scalar

types=()
help_requested=false
while ((#)); do
  if [[ $1 == --*=* ]] argv[1]=("${1%%=*}" "${1#*=}")
  case $1 in
    -t|--type




# if [ $((${#help_requested} + ${#type})) -eq 0 ]
# then
#   help_requested=(true)
# fi

# echo $1

# for i in $type; do
#   echo ${i}
# done
#
# help_text="
# This is line one (or two, really—line one oof text, but there's an empty line above).
# [This space intentionally left blank. Well, actually, how 'bout the space below?]
#
# Last line now. Or, last line of text, I guess, plus a new line.
# "
#
#
# if [ ${#help_requested} -gt 0 ]
# then
#   echo $help_text
# else
#   echo "Guess you're good then."
# fi
#
# # echo "Moving on"
# # echo "...
# # "
# # echo "…
# # "
#
# # for i in $type; do
# #   if [[ ${known_types[(r)$i]} ]]; then
# #     echo $i
# #   fi
# # done
#
# if [ ${#type} -gt 0 ]
# then
#   for i in $type; do
#     if [[ ${known_types[(r)$i]} ]]; then
#       case $i in
#         html | css )
#           copy_css=$((copy_css+1))
#           if [[ $i == "html" ]]; then
#             copy_robots=$((copy_robots+1))
#           fi
#         ;;
#         python | r )
#         ;;
#         * )
#         ;;
#       esac
#     fi
#   done
# else
#   echo "No types entered"
# fi
#
# echo $copy_css
# echo $copy_robots
