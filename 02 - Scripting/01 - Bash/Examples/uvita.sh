#!/bin/bash

dir=$(pwd)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive


# Catch CTRL+C for exiting the script execution
trap ctrl_c INT

ctrl_c(){
	echo "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	exit 0
}

helpPanel(){
	echo "\n${yellowColour}[*]${endColour}${grayColour} Uso: sh 00-crear.sh${endColour}"
	echo "\n\t${purpleColour}-u${endColour}${yellowColour} Usuario${endColour}"
	echo "\t${purpleColour}-n${endColour}${yellowColour} Nombre${endColour}"
        echo "\t${purpleColour}-a${endColour}${yellowColour} Apellido${endColour}"
	echo "\t${purpleColour}-m${endColour}${yellowColour} Mostrar archivos de un usuario${endColour}"
	echo "\t${purpleColour}-p${endColour}${yellowColour} Crear Public Key de un usuario${endColour}"
	echo "\t${purpleColour}-h${endColour}${yellowColour} Mostrar este panel de ayuda${endColour}"
	echo "\n${yellowColour}[*]${endColour}${grayColour} Ejemplos:${endColour}\n"
	echo "\t${blueColour}sh 00-crear.sh -u gbarud -n Gerado -a Barud${endColour}"
	echo "\t${blueColour}sh 00-crear.sh -m gbarud${endColour}"
	echo "\t${blueColour}sh 00-crear.sh -p gbarud${endColour}\n"
	exit 0
}

crear_usuario(){

	usuario=$dir/$1.sls

	echo "\n\n${purpleColour}############## CREANDO $usuario ##############${endColour}"
	if test -f "$usuario"; then
		echo "${redColour}-------> El archivo ${yellowColour}$usuario${endColour} ${redColour}ya existe${endColour}"
	else
		echo "$1:" >> $usuario
		echo "  user.present:" >> $usuario
		echo "    - fullname: $2 $3" >> $usuario
		echo "    - shell: /bin/bash" >> $usuario
		echo "    - home: /home/$1" >> $usuario
		echo "    - createhome: True" >> $usuario
		echo "    - password: NO_PASSWORD" >> $usuario
		echo "    - groups:" >> $usuario
		echo "      - sudo" >> $usuario
		echo "" >> $usuario
		echo "$1_key:" >> $usuario
		echo "  ssh_auth.present:" >> $usuario
		echo "    - user: $1" >> $usuario
		echo "    - source: salt://files/ssh_keys/$1.pub" >> $usuario
		echo "    - require:" >> $usuario
		echo "      - user: $1" >> $usuario
		echo "${greenColour}-------> Archivo creado OK${endColour}"
	fi
}

crear_usuario_eliminar(){

	usuario_eliminar=$dir/$1_eliminar.sls

	echo "\n\n${purpleColour}############## CREANDO $usuario_eliminar ##############${endColour}"
        if test -f "$usuario_eliminar"; then
                echo "${redColour}-------> El archivo ${yellowColour}$usuario_eliminar${endColour} ${redColour}ya existe${endColour}"
        else
                echo "$1:" >> $usuario_eliminar
                echo "  user.absent:" >> $usuario_eliminar
                echo "    - purge: true" >> $usuario_eliminar
                echo "${greenColour}-------> Archivo creado OK${endColour}\n"
        fi

	echo "\n"

}

crear_publica(){

	publica=/srv/salt/files/ssh_keys/$1.pub

        echo "\n\n${purpleColour}############## CREANDO $publica ##############${endColour}"
        if test -f "$publica"; then
                echo "${redColour}-------> El archivo ${yellowColour}$publica${endColour} ${redColour}ya existe${endColour}"
		echo "\n${blueColour}cat $publica${endColour}"
                cat $publica
        else
		echo "${turquoiseColour}Ingrese Public Key del usuario $1:${endColour}"
		read clave
		echo "$clave" >> $publica
                echo "${greenColour}-------> Archivo creado OK${endColour}"

        fi

	echo "\n"

	exit 0
}


mostrar_usuario(){

	usuario=$dir/$1.sls
	usuario_eliminar=$dir/$1_eliminar.sls
	publica=/srv/salt/files/ssh_keys/$1.pub

        echo "\n\n${purpleColour}############## USUARIO $user ##############${endColour}"

        if test -f "$usuario"; then
		echo "\n${blueColour}cat $usuario${endColour}"
		cat $usuario
        else
		echo "${redColour}-------> El archivo ${yellowColour}$usuario${endColour} ${redColour}NO existe${endColour}"
        fi

        if test -f "$usuario_eliminar"; then
		echo "\n${blueColour}cat $usuario_eliminar${endColour}"
                cat $usuario_eliminar
        else
                echo "${redColour}-------> El archivo ${yellowColour}$usuario_eliminar${endColour} ${redColour}NO existe${endColour}"
        fi

        if test -f "$publica"; then
		echo "\n${blueColour}cat $publica${endColour}"
                cat $publica
        else
                echo "${redColour}-------> El archivo ${yellowColour}$publica${endColour} ${redColour}NO existe${endColour}"
        fi


        echo "\n"
	exit 0
}


# Main Function

if [ "$(id -u)" = "0" ]; then
	parameter_counter=0
    # Specifing options parameters that will be catch
	while getopts ":u:n:a:p:m:h:" arg; do
		case $arg in
			u) user=$OPTARG; parameter_counter=$((parameter_counter+1)) ;;
			n) nombre=$OPTARG; parameter_counter=$((parameter_counter+1)) ;;
			a) apellido=$OPTARG; parameter_counter=$((parameter_counter+1)) ;;
			p) user_publica=$OPTARG; crear_publica $user_publica ;;
			m) user_mostrar=$OPTARG; mostrar_usuario $user_mostrar;;
			h) helpPanel;;
		esac
	done

	case $parameter_counter in
		3) crear_usuario $user $nombre $apellido; crear_usuario_eliminar $user; crear_publica $user;;
		*) helpPanel;;
	esac
else
	echo "\n${redColour}[*] No soy root${endColour}\n"
fi
