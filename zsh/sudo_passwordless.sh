#/bin/bash -x
s_user=$(whoami)
sudo sh -c "echo '$s_user  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/${s_user}"
