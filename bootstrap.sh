#!/bin/bash

if ! command -v ansible &> /dev/null
then
    echo 'Installing Ansible...'
    sudo apt update >/dev/null 2>&1
    sudo apt install ansible -y >/dev/null 2>&1
fi

echo 'The following tasks will be performed as part of the playbook:'
ansible-playbook playbook.yml --list-tasks | sed -n '/tasks:/,/tasks:/p' | sed '1d;'
echo ''
read -p "Do you want run the WSL playbook now? (y/n): " -n 1 -r
echo ''
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Playbook is running... You will be asked for your sudo password to be able to perform certain tasks."
    ansible-playbook -K playbook.yml
else
    echo "To run the playbook later, run 'ansible-playbook -K playbook.yml'"
fi

