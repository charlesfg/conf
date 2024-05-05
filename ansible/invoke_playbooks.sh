#!/bin/bash

HOST=l1v4-18
#HOST=xen5
ansible-playbook -i inventory.yaml --limit ${HOST} init_server.yml
ansible-playbook -i inventory.yaml --limit ${HOST} oh_my_zsh.yml
