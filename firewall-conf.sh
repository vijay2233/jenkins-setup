#!/bin/bash

##################################################################################
## Script to enable jenkins service port 8080					##
##################################################################################

#port="8080"
#service="jenkins"

enable_firewall_port()
{
 sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp >/dev/null 2>&1

 echo -e "\nOpening firewall port 8080"
 sudo firewall-cmd --reload >/dev/null 2>&1
 echo -e "\nReloaded firewall rules..."
}
