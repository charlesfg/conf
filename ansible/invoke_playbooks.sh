#!/bin/bash

ansible-playbook -i inventory.yaml --limit xen4 init_server.yml
ansible-playbook -i inventory.yaml --limit xen4 oh_my_zsh.yml