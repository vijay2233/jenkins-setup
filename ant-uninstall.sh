#!/bin/bash

#################################################################################
## 		ANT SETUP							#
## This is script will download and install apache-ant-1.9.11 			#
#################################################################################

ant_archive="apache-ant-1.9.11-bin.tar.gz"
ant_dir="apache-ant-1.9.11"
ant_dest="/usr/lib/ant"
ant_executable="/usr/bin/ant"

uninstall_ant()
{
 ant -version >/dev/null 2>&1
 if [ $? -eq 0 ]
 then
     echo -e "\n\e[42m[INFO]\e[0m Aapache Ant found, and removing . . . ."
     rm -rf $ant_archive
     echo -e "\n\e[43m[INFO]\e[0m $ant_archive removed from your directory"        
     rm -rf $ant_dir
     sudo rm -rf $ant_dest
     sudo rm -rf $ant_excutable
     echo -e "\n\e[42m[INFO]\e[0m Apache Ant removed successfully......\n"
 else
 echo -e "\e[43m[INFO]\e[0m Aapache Ant not found. . . .\n"
 fi
}

uninstall_ant
