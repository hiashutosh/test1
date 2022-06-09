#!/bin/bash
supervisorctl stop all
sudo rm -rf /etc/supervisor/conf.d/merchant.conf
sudo rm -rf /etc/supervisor/conf.d/skor.conf
sudo systemctl start supervisor.service && sudo systemctl enable supervisor.service
supervisorctl reload
sleep 10
sudo mount -a && supervisorctl start all || sudo shutdown 0
