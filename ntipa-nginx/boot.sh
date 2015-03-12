#!/bin/bash
echo "[nginx] starting nginx service..."
service nginx start

cat /etc/nginx/sites-enabled/app.conf
tail -f /var/log/nginx/*.log
