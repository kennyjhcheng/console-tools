usage() {
    echo "====================================USAGE===================================="
    echo "     Description: Combine multiple pdfs to one output pdf                   *"
    echo "*    Required Flag: -o output file name                                     *"
    echo "*                   -f list of files to combine comma separated             *"
    echo "*    Optional Flag:                                                         *"
    echo "*    Example command: ./combinePDFs.sh -o output.pdf -f file1.pdf,file2.pdf *"
    echo "============================================================================="
}

OUTPUT=''
FILES=''
# from https://unix.stackexchange.com/a/164260
while getopts ":hf:o:" opt; do
    case $opt in
        f ) echo "Files arg: $OPTARG "
            set -f # disable glob
            IFS=, # split on space characters
            # IFS=" " space separated with args in quotes
            array=($OPTARG) # use the split+glob operator
            ;; 
        o ) OUTPUT=$OPTARG
            ;;
        h | *) 
            usage
            exit 0 
            ;;
    esac
done

echo "Number of files: ${#array[@]}"
for i in "${array[@]}"; do
  FILES+="${i} "
done
echo "Files to combine are: $FILES"
printf "\b \n"

gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$OUTPUT "${array[@]}"