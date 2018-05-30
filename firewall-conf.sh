#!/bin/bash

##################################################################################
## Script to enable jenkins service port 8080					##
##################################################################################

#port="8080"
#service="jenkins"

enable_firewall_port()
{
 sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
 sudo firewall-cmd --reload
}



