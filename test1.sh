# #!/bin/bash

# while true; do
#     clear  # Clear the screen
#     echo "Choose a Linux distribution:"
#     options=("Ubuntu" "Debian" "CentOS" "Arch Linux" "Exit")
    
#     trap '' INT

#     # Display options with pointer
#     for i in "${!options[@]}"; do
#         if [ $i -eq $selected ]; then
#             echo -e "> ${options[i]}"
#         else
#             echo "  ${options[i]}"
#         fi
#     done

#     # Read user input
#     read -rsn1 key

#     case "$key" in
#         "A")  # Up arrow key
#             ((selected > 0)) && ((selected--))
#             ;;
#         "B")  # Down arrow key
#             ((selected < ${#options[@]} - 1)) && ((selected++))
#             ;;
#         "q")  # 'q' key to pause
#             echo "Pausing the menu. Press any key to resume..."
#             read -n 1 -s
#             ;;
#         "")   # Enter key
#             # Handle the selected choice
#             case ${options[selected]} in
#                 "Ubuntu")
#                     echo "You selected Ubuntu."
#                     docker run -it ubuntu
#                     ;;
#                 "Debian")
#                     echo "You selected Debian."
#                     docker run -it debian
#                     ;;
#                 "CentOS")
#                     echo "You selected CentOS."
#                     docker run -it centos
#                     ;;
#                 "Arch Linux")
#                     echo "You selected Arch Linux."
#                     docker run -it archlinux
#                     ;;
#                 "Exit")
#                     echo "Exiting the menu."
#                     exit 0
#                     ;;
#             esac
#             ;;
#     esac
# done



#!/bin/bash

options=("Ubuntu" "Debian" "CentOS" "Arch Linux" "Exit")
selected=0

while true; do

    trap '' INT

    # Display Vite project types with the arrow selector
    for ((i=0; i<${#options[@]}; i++)); do
        if [ $i -eq $selected ]; then
            echo -e "\e[1;33m=> ${options[i]}\e[0m";
        else
            echo "   ${options[i]}"
        fi
    done

    # Read a single character from the user
    read -s -n 1 key

    case $key in
        "A")    # Up arrow key
            ((selected--))
            [ $selected -lt 0 ] && selected=$(( ${#options[@]} - 1 ))
            ;;
        "B")    # Down arrow key
            ((selected++))
            [ $selected -ge ${#options[@]} ] && selected=0
            ;;
        "")     # Enter key
            case ${options[selected]} in
                "Ubuntu")
                    echo "You selected Ubuntu."
                    docker run -it ubuntu
                    ;;
                "Debian")
                    echo "You selected Debian."
                    docker run -it debian
                    ;;
                "CentOS")
                    echo "You selected CentOS."
                    docker run -it centos
                    ;;
                "Arch Linux")
                    echo "You selected Arch Linux."
                    docker run -it archlinux
                    ;;
                "Exit")
                    echo "Exiting the menu."
                    exit 0
                    ;;
            esac
            ;;
    esac
    clear
done
