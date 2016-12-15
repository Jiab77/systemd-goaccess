#!/bin/bash

echo -e "Copying binaries...\n"
sudo cp -v goaccess-report /usr/local/bin/
sudo cp -v goaccess-reportssl /usr/local/bin/
sudo chmod -v +x /usr/local/bin/goaccess-report
sudo chmod -v +x /usr/local/bin/goaccess-reportssl

echo -e "Installing service...\n"
sudo cp -v goaccess-report.conf /etc/systemd/
sudo cp -v goaccess-report.service /lib/systemd/system/
sudo cp -v goaccess-reportssl.service /lib/systemd/system/

echo -e "Reloading services configuration...\n"
sudo systemctl daemon-reload

echo -e "Enable goaccess-report service...\n"
sudo systemctl enable goaccess-report
sudo systemctl enable goaccess-reportssl

echo -e "Done.\n"
echo -e "Edit as root 'goaccess-report.conf' in /etc/systemd to feet your needs then run :"
echo -e "sudo systemctl start goaccess-report"
echo -e "sudo systemctl start goaccess-reportssl\n"
echo -e "That's all ^^\n"
