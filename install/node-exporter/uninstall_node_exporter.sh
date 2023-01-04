
#!/bin/bash

systemctl stop node-exporter
rm -rf /usr/local/node-exporter
rm -rf /usr/lib/systemd/system/node-exporter.service
