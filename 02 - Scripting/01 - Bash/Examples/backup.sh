#!/bin/sh

current_date=$(date +%Y-%m-%d)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

ctrl_c(){
	echo "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	exit 1
}

helpPanel(){
	echo "\n${yellowColour}[*]${endColour}${grayColour} Usage: ./backup.sh${endColour}"
	echo "\n\t${purpleColour}-s${endColour}${yellowColour} <SOURCE_PATH>${endColour}"
    echo "\t\t${grayColour} Syncronization source path${endColour}"
	echo "\n\t${purpleColour}-d${endColour}${yellowColour} <TARGET_PATH>${endColour}"
    echo "\t\t${grayColour} Syncronization target path${endColour}"
    echo "\n\t${purpleColour}-h${endColour}"
    echo "\t\t${grayColour} Show this Help Panel${endColour}"
	echo "\n${yellowColour}[*]${endColour}${grayColour} Examples:${endColour}\n"
	echo "\t${blueColour}./backup.sh -s /path/to/source/ -d /path/to/target${endColour}"
	echo "\t${blueColour}./backup.sh -h${endColour}\n"
	exit 0
}

syncro(){
# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsynk to be installed."
    echo "Please use your distribution's package manager to install it and try again."
    exit 2
fi

# [-a: mateins permissions] [-v: verbose] [-b: make backups (it doesn't replace changed files)]
# --delete: allow to delete files in the target path if it is deleted in the source path
# --dry-run: this options is for a simulated execution
rsync_options="-avb --suffix=.$current_date --delete"

echo -e "\n############ STARTING SYNC `date "+%d/%m/%Y-%H:%M:%S"`############\nd" >> $logfile
$(which rsync) $rsync_options $source $target/current >> backup_$current_date.log
}

# main
parameter_counter=0

while getopts ":s:d:h:" arg; do
    case $arg in
		s) source=$OPTARG; parameter_counter=$((parameter_counter+1)) ;;
		d) target=$OPTARG; parameter_counter=$((parameter_counter+1)) ;;
		h) helpPanel;;
	esac
done

# Cheking if parameter_counter=3 in order to call the proper function. If not, show the Help Panel
case $parameter_counter in
	2) syncro $source $target;;
	*) helpPanel;;
esac