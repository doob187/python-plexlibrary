#!/bin/bash
#########################################################################
# Title:         Cloudbox: Python-PlexLibrary Helper Script             #
# Author(s):     desimaniac                                             #
# URL:           https://github.com/cloudbox/cloudbox                   #
# --                                                                    #
#         Part of the Cloudbox project: https://cloudbox.works          #
#########################################################################
#                   GNU General Public License v3.0                     #
#########################################################################
#                 CUSTOM SCRIPT WITH CRONATB AUTO ADD                   #
#########################################################################
##USERSIDE EDITS !!
FOLDER="/opt/appdata"
CRONTIME="daily"
RENOVEOLD="/mnt/recipes/"

###
###dont edit below !!!
CRONTABFILE="/tmp/mycron"
PATH='/usr/bin:/bin:/usr/local/bin'
export PYTHONIOENCODING=UTF-8

sudocheck() {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  else
     owned
     plexpython
  fi  
}
owned() {
 if [[ ! -f "$CRONTABFILE" ]]; then
    sudo chmod +x ${FOLDER}/python-plexlibrary/scripts/plexlibrary.sh
    crontab -l > /tmp/mycron
    echo "@${CRONTIME} bash ${FOLDER}/python-plexlibrary/scripts/plexlibrary.sh" >> /tmp/mycron
    crontab /tmp/mycron
    echo "Python-Plexlibrary ${CRONTIME} Crontab is added" 
 else
    echo "Python-Plexlibrary  ${CRONTIME} Crontab is already added" 
 fi
}

plexpython() {
truncate -s 0 ${FOLDER}/python-plexlibrary/plexlibrary.log
echo $(date) | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
echo "" | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log

for file in ${FOLDER}/python-plexlibrary/recipes/*
do
    if [ ! -d "${file}" ]; then
        /usr/bin/python3 ${FOLDER}/python-plexlibrary/plexlibrary/plexlibrary.py $(basename "$file" .yml) | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
        echo "" | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
    fi
done
}
####### FUNCTIONS LINE
sudocheck
####### FUNCTIONS LINE
