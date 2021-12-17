# MTC Slave Node

This script is used for provining a VM as a Jenkins slave node for MTC testing

## Initiate Project

### Create virtual environment

```
$ python3 -m venv .venv
$ source .venv/bin/activate

# To get out of the env execute
# $ deactivate
```

### Install the requirements

```
$ python3 -m pip install --upgrade pip
$ pip3 install -r requirements.txt
```

### Install the required Ansible roles

```
$ ansible-galaxy install -r requirements.yml
```

```
$ ./slave.sh <username>  <password>  <ssh_key path>   
```