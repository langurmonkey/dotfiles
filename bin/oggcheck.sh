#!/bin/bash
# This script is designed to use oggz-tools to detect corrupt/invalid OGG files.

# Check to make sure oggz-tools is installed.
command -v oggz-validate >/dev/null 2>&1 || { echo >&2 "The package oggz-tools is required, but it is not installed. Aborting."; exit 1; }

# Get the path to the current directory.
path=`pwd`/;

# Create your output function to send the output to the terminal or to a file on the Desktop called oggfix_log.txt.
output () {
    if [ "$tofile" == 'y' ]; then
        echo "$1" >> ~/Desktop/oggcheck.log
    else
        echo "$1"
    fi
}

echo "Do you want to send the results to a file on your Desktop? (y or n, default=n)"
read tofile
if [ -z "$tofile" ]; then
    tofile='n'
fi
output "The following songs return errors when tested with oggz-validate:"

# Loop through the artists.
# Check each OGG file, and only include them in output if they are invalid. You suppressed the output of the oggz-validate command and set it to a variable "validate" to check.    
fd -t f --extension ogg | while read -r fname
do
    validate="$(oggz-validate "$fname" 2>&1)"
    # Only output the song if it is invalid.
    if [ -n "$validate" ]; then
        output "$fname"
    fi
done
echo "Done."
