
#!/bin/bash

systemctl stop mytopling-exporter
rm -rf /usr/local/mytopling-exporter
rm -rf /usr/lib/systemd/system/mytopling-exporter.service
