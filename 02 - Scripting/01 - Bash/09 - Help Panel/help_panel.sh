#!/bin/sh

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

helpPanel(){
	echo "\n${yellowColour}[*]${endColour}${grayColour} Usage: ./script.sh${endColour}"
	echo "\n\t${purpleColour}-u${endColour}${yellowColour} <USERNAME>${endColour}"
    echo "\t\t${grayColour} Set user username${endColour}"
	echo "\n\t${purpleColour}-f${endColour}${yellowColour} <FIRST NAME>${endColour}"
    echo "\t\t${grayColour} Set user first name${endColour}"
    echo "\n\t${purpleColour}-l${endColour}${yellowColour} <LAST NAME>${endColour}"
    echo "\t\t${grayColour} Set user last name${endColour}"
	echo "\n\t${purpleColour}-s${endColour}"
    echo "\t\t${grayColour} Show list of users${endColour}"
	echo "\n\t${purpleColour}-h${endColour}"
    echo "\t\t${grayColour} Show this Help Panel${endColour}"
	echo "\n${yellowColour}[*]${endColour}${grayColour} Examples:${endColour}\n"
	echo "\t${blueColour}./script.sh -u gbarud -f Gerado -l Barud${endColour}"
	echo "\t${blueColour}./script.sh -s${endColour}"
	echo "\t${blueColour}./script.sh -h${endColour}\n"
	exit 0
}

helpPanel