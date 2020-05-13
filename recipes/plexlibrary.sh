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
FOLDER="/opt/appdata"

PATH='/usr/bin:/bin:/usr/local/bin'
export PYTHONIOENCODING=UTF-8
echo $(date) | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
echo "" | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log

for file in ${FOLDER}/python-plexlibrary/recipes/*
do
    if [ ! -d "${file}" ]; then
        /usr/bin/python3 ${FOLDER}/python-plexlibrary/plexlibrary/plexlibrary.py $(basename "$file" .yml) | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
        echo "" | tee -a ${FOLDER}/python-plexlibrary/plexlibrary.log
    fi
done
