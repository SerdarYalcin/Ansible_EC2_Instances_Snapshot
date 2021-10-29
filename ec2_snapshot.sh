array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'
array['ec2 instance ip']='ec2 instance id'

for i in "${!array[@]}"
do
    linux_connection=$(telnet $i 22 </dev/null 2>&1 | grep Connected | awk '{print $1}')
    windows_connection=$(telnet $i 3389 </dev/null 2>&1 | grep Connected | awk '{print $1}')
    if [[ "$linux_connection" == "Connected" ]] || [ "$windows_connection" == "Connected" ]; then
         echo "$i Connected."
         echo "instance id ${array[$i]}"
         devicename=$(cat device_name.txt | grep ${array[$i]} | awk '{print $2}')
         ansible-playbook ec2_snapshot.yml --extra-vars "instanceid=${array[$i]}" --extra-vars "device=$devicename" --vault-password-file /etc/ansible/group_vars/ansible-vault.pass
    else
        echo "$i not Connected."
    fi
done
