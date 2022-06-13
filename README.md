# ansible-ec2-snapshot
ec2 snapshot using bash script for running state ec2 instances & vmware snapshot

## Usage

Update vmware_snapshot.yml and vmware.yml files properly for vmware virtual machines
Update the device_name.txt file with your instance id and root device name for ec2 instances

```
i-00abcdert13214sd /dev/sda1  
i-00asdvasd123rasd /dev/sda1 
```

Update the `ec2_snapshot.sh` script with ec2 instance ip and ec2 instance id
```
array['i-00abcdert13214sd']='10.10.10.10' # That is not an real instance id and ip
array['i-00abcdert13214sd']='10.10.10.10' # That is not an real instance id and ip

Note: you should also update the vault password location
```
You do not need to do any changes in ec2_snapshot.yml file however you should do update the host file properly.

You can refer to the below script if you would like to create a cron job
````
# Run the script once a month
0 0 1 * * ansible-ec2-snapshot/ec2_snapshot.sh
````
