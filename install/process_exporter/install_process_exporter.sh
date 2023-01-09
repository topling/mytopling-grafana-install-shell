#!/bin/bash

cur_path=$(cd $(dirname $0); pwd)
service_file=${cur_path}/process_exporter.service
config_file=${cur_path}/process-exporter-ncabatoff.yml
bin_path=/usr/local/process-exporter

mkdir -p ${bin_path}

if [ ! -f "${bin_path}/process-exporter-0.4.0.linux-amd64.tar.gz" ]; then
	cp ${cur_path}/../../download/process-exporter-0.4.0.linux-amd64.tar.gz ${bin_path}
	cd ${bin_path}
	tar -xvf process-exporter-0.4.0.linux-amd64.tar.gz
fi

cp ${config_file} ${bin_path}/process-exporter-0.4.0.linux-amd64/
cp ${service_file} /etc/systemd/system/

chown -R prometheus:prometheus ${bin_path}
systemctl daemon-reload
systemctl enable process_exporter
systemctl start process_exporter

