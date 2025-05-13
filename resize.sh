#!/usr/bin/env bash

# This script resizes all the images it finds in a folder (and its subfolders) and resizes them
# The resized image is placed in the /resized folder which will reside in the same directory as the image
#

initial_folder="${1:?use argument to set the initial folder}"
resized_folder_name="resized"
resized_size="700"

all_images=$(find -E "$initial_folder" -iregex ".*\.(jpg|gif|png|jpeg)")

while read -r image_full_path; do
    filename=$(basename "$image_full_path")
    source_folder=$(dirname "$image_full_path")
    destination_folder="$source_folder/$resized_folder_name/"
    destination_full_path=$destination_folder$filename

    if [ ! -z "$image_full_path" -a "$image_full_path" != " " ] &&
        # Do not resize images inside a folder that was already resized
        [ "$(basename "$source_folder")" != "$resized_folder_name" ]; then 

        # If you are not using this in an OSX system, you can use imagemagick's "convert" command instead (http://www.imagemagick.org/script/convert.php)
        if [ "$(identify -ping -format '%w' site/content/boat/morning.jpeg)" != 700 ]; then
            echo "resizing $destination_full_path"
            mkdir -p "$destination_folder"
            sips -Z "$resized_size" "$image_full_path" --out "$destination_full_path"
        else
            echo "already resized ... skipping $destination_full_path"
        fi
    fi
done <<< "$all_images"
