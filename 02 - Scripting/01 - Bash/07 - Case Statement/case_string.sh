#!/bin/bash

echo "Enter a fruit name: "
read fruit

case $fruit in
    "apple")
        echo "You selected an apple."
        ;;
    "banana")
        echo "You selected a banana."
        ;;
    "orange")
        echo "You selected an orange."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac