#!/bin/bash

HOST=l1v4-18
ansible-playbook -i inventory.yaml --limit l1v4-18 init_server.yml
ansible-playbook -i inventory.yaml --limit l1v4-18 oh_my_zsh.yml
