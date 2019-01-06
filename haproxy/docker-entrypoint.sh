#!/bin/sh

# Make sure service is running
service rsyslog start
echo "Started rsyslog"

# Touch the log file so we can tail on it
touch /var/log/haproxy.log
echo "touched the haproxy.log file"

# Throw the log to output
tail -f /var/log/haproxy.log &
echo "Thrown the log to output"

# Start haproxy
exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
echo "started haproxy"
