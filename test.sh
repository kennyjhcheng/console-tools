#!/bin/bash 

# -----order of iterating through files
# FILES=""
# for FILE in *; 
# do 
#     FILES+="${FILE}"
# done

# echo $FILES

# -----accpting multiple arguments from flags
# while getopts ":hr:l:" opt; do
#     case $opt in
#         r ) echo "Run Numbers - argument = $OPTARG "
#             set -f # disable glob
#             IFS=, # split on space characters
#             # IFS=" "
#             array=($OPTARG) ;; # use the split+glob operator
#         l ) echo "Latency range - argument = $OPTARG" ;;
#         h ) helptext
#             graceful_exit ;;
#         * ) usage
#             clean_up
#             exit 1
#     esac
# done

# echo "Number of arguments: ${#array[@]}"
# echo -n "Arguments are:"
# for i in "${array[@]}"; do
#   echo -n " ${i},"
# done
# printf "\b \n"