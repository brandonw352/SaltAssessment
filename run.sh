#!/bin/bash
sed -i 's/#file_client:\ remote/file_client:\ local/g' /etc/salt/minion
systemctl stop salt-minion
mkdir /srv/salt
mkdir /srv/salt/files
curl -L https://raw.githubusercontent.com/brandonw352/SaltAssessment/master/master.sls -o /srv/salt/master.sls
salt-call --local state.apply master
