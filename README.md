# ansible-ec2-snapshot for running state instances
ec2 snapshot automation with Ansible and bash script

## Usage

Setup your ec2 Variables in the `vars/ec2_env.yml` file

```YAML
device_name: # Instance Root Device (eg. /dev/sda)
name: # Your EC2 Instance Name
```

Update the `ec2_snapshot.sh` script to set if you want to add or delete a snapshot

```Shell
ansible-playbook playbook.yml -e"add_snapshot=true del_snapshot=false"
```

Create a CRON job to execut the script automatically

```
# Run the script once a month
0 0 1 * * ansible-ec2-snapshot/ec2_snapshot.sh
```
