#!/bin/bash

kill -QUIT `cat /var/run/unicorn-scientist.pid`
sleep 2
cd /srv/young-scientist
sudo -u www unicorn -c unicorn.rb -E production -D

