#!/bin/bash
echo "[nginx] starting nginx service..."
service nginx start
 
tail -f /var/log/nginx/*.log
