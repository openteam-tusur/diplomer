#!/bin/bash

kill -QUIT `cat /var/run/unicorn/unicorn-diplomer.pid`
sleep 2
cd /srv/diplomer
sudo -u www unicorn -c unicorn.rb -E production -D

