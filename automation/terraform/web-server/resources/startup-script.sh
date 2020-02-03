#!/bin/bash
sudo su
apt update
apt install apache2 -y
echo 'This webserver has been provisioned via Terraform' > /var/www/html/index.html