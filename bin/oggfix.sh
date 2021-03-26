#!/bin/sh
# This script is designed to use oggz-tools to detect corrupt/invalid OGG files and to fix them by saving the tags--if any--decoding, then re-encoding the file, and writing the tags back to the file.

# Make sure they know what they're doing.
echo "Make sure you have a backup! This script will delete the original files after re-encoding them. Are you sure you want to continue? (y or n, default=n)"
read doit
if [ -z "$doit" ]; then
    doit='n'
fi
if [ "$doit" != 'y' ]; then
    echo "Aborting script...no files altered."
    exit 1
fi

# Get the path to the current directory.
path=`pwd`/;

# Create your output function to send the output to the terminal or to a file on the Desktop called oggfix_log.txt.
output () {
    printf "%s\n" "$1"
}

# Check to make sure the required packages are installed.
output "Checking for required packages..."
command -v oggz-validate >/dev/null 2>&1 || { echo >&2 "The package oggz-tools is required, but it is not installed. Aborting."; exit 1; }
command -v oggdec >/dev/null 2>&1 || { echo >&2 "The package vorbis-tools or a package containing oggdec is required, but is not installed. Aborting."; exit 1; }
command -v oggenc >/dev/null 2>&1 || { echo >&2 "The package vorbis-tools or a package containing oggenc is required, but is not installed. Aborting."; exit 1; }
command -v vorbiscomment >/dev/null 2>&1 || { echo >&2 "The package vorbis-tools or a package containing vorbiscomment is required, but is not installed. Aborting."; exit 1; }
output "All required packages found, beginning search for invalid OGG files..."

fd -t f --extension ogg | while read -r fname
do
    # Check each OGG file, and only include them in output if they are invalid. You suppressed the output of the oggz-validate command and set it to a variable "validate" to check.    
    validate="$(oggz-validate "$fname" 2>&1)"
    # Only output the song if it is invalid.
    if [ -n "$validate" ]; then
        # Get the song name for use in output.
        oggname=$(basename "$fname")
        # First, save the tags from the original file:
        output "Saving metadata from: $oggname..."
        vorbiscomment -l "$fname" >> "$fname".tags
        # Try to get the bitrate of the original file. Note that this depends on ogginfo not changing the way it outputs the "Nominal bitrate". If it fails, that might be the cause.
        info=$(ogginfo "$fname" 2>&1)
        # Get the next-to-last field on the line with "Nominal bitrate" on it, which should give you the number without the units.
        bitrate=$(echo "$info" | awk '/^Nominal bitrate/{print $(NF - 1)}')
        # Round off the bitrate to a whole number.
        bitrate=$(printf '%.0f\n' $bitrate)
        # Next, decode the original ogg file, creating a wav file, and in the process, losing all the tags.
        oggdec "$fname"
        # Save the name of the wav to a new variable.
        wav="${fname%.*}.wav"
        wavname=$(basename "$wav")
        # Delete the original ogg file.
        output "Deleting $oggname..."
        rm "$fname"
        # Now, re-encode the wav file as an ogg, using the bitrate of the original file, if you got one.
        # Set a regular expression to check for integer values.
        re='^[0-9]+$'
        if ! [[ $bitrate =~ $re ]]; then
            # In this case, bitrate is not an integer, so set a default.
            bitrate=160
        fi
        oggenc -b $bitrate "$wav"
        # Delete the wav file.
        output "Deleting $wavname..."
        rm "$wav"
        # Next, write the tags back to the new ogg file.
        vorbiscomment -w -c "$fname".tags "$fname"
        # Delete the tags file.
        output "Deleting the tags file..."
        rm "$fname".tags
        output "Done processing $oggname."
    fi   
done

