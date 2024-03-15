#!/bin/bash

# Function to ask for user confirmation
confirm() {
    while true; do
        read -r -p "Do you wish to continue? [Y/n] " response
        case "$response" in
            [yY][eE][sS]|[yY]|"")
                echo "Continuing..."
                break
                ;;
            [nN][oO]|[nN])
                echo "Exiting."
                exit
                ;;
            *)
                echo "Invalid input... please answer yes or no."
        esac
    done
}


echo "Searching for GCC version"
gcc_v=()

while IFS= read -r line; do
    # Append each line to the array
    gcc_v+=("$line")
done < <(apt search gcc 2>/dev/null | grep 'gcc-[0-9]\+/' | cut -d/ -f1  | sort -Vr)

echo "Avaliable versions of gcc and its priority:"
echo 

PRIORITY=100

for g in "${gcc_v[@]}"; do
    echo $g $PRIORITY
    PRIORITY=$(($PRIORITY-10))
done

PRIORITY=100

echo 

# Call the confirm function
confirm



echo 
echo "Installing repository and default system version"
echo 

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update

sudo apt-get install -y gcc g++ 

confirm

sudo update-alternatives --remove-all gcc

for g in "${gcc_v[@]}"; do

    echo "Installing $g version ... "

    # Extract the version number using parameter substitution
    v="${g#gcc-}"
    
    # Example: use the new variable
    echo "GCC Version: gcc-${v}, Corresponding G++ Version: g++-${v}"

    sudo apt-get install -y gcc-${v} g++-${v} 
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/${g} $PRIORITY --slave /usr/bin/g++ g++ /usr/bin/${g}
    PRIORITY=$(($PRIORITY-10))

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${v} ${PRIORITY} \
     --slave /usr/bin/g++ g++ /usr/bin/g++-${v} \
     --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-${v} \
     --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-${v} \
     --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib--${v} \
     --slave /usr/bin/gcov gcov /usr/bin/gcov-${v}

done

sudo update-alternatives --config gcc

