#!/bin/bash
finished=0

while [ $finished -ne 1 ]
do
    echo "Select a programming language:"
    echo "1. Python"
    echo "2. Java"
    echo "3. JavaScript"
    echo "4. C++"
    echo "5. Ruby"
    echo "6. Exit"
    read choice

    case $choice in
        1)
            echo "You selected Python."
            ;;
        2)
            echo "You selected Java."
            ;;
        3)
            echo "You selected JavaScript."
            ;;
        4)
            echo "You selected C++."
            ;;
        5)
            echo "You selected Ruby."
            ;;
        6)
            echo "Bye bye."
            finished=1
            ;;
        *)
            echo "Invalid choice."
            ;;        
    esac
done