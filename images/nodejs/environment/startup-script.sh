#!/bin/bash
apt update
apt install nodejs -y
gsutil cp -r gs://injenia-gcp-demo-demo/app /usr/local/app
cd /usr/local/app
