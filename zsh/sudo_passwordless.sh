#/bin/bash -x
s_user=$(whoami)
sudo sh -c "echo '$s_user  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/${s_user}"



- name: Allow the current  user to sudo without password
  community.general.sudoers:
    name: sudo-passwordless
    state: present
    user: {{ansible_user}}
    noppassword: true
    commands: ALL