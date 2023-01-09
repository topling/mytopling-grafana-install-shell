#!/bin/bash

if [ "${check_if_include_config}" = "" ]; then
	cur_path=$(cd $(dirname $0); pwd)
	source ${cur_path}/../config.sh
fi
check_user

cur_path=$(cd $(dirname $0); pwd)
download_path=${cur_path}/../../download
mytopling_exporter_service_file=${cur_path}/mytopling-exporter.service

sed "s/9104/${mytopling_exporter_listen_address}/g" ${cur_path}/mytopling-exporter.service.base > ${mytopling_exporter_service_file}

#安装mytopling-exporter：
function mytopling_exporter_config() {
	cd ${download_path}
	tar xf mysqld_exporter-0.14.0.linux-amd64.tar.gz
	mv mysqld_exporter-0.14.0.linux-amd64 /usr/local/mytopling-exporter
	cd /usr/local/mytopling-exporter/
}

function mytopling_exporter_dir() {
	groupadd -f mytopling-exporter
	useradd -g mytopling-exporter -s /sbin/nologin mytopling-exporter > /dev/null 2>&1
	chown -R mytopling-exporter:mytopling-exporter  /usr/local/mytopling-exporter
}

function start_mytopling_exporter() {
	cp ${mytopling_exporter_service_file} /etc/systemd/system/mytopling-exporter.service
	systemctl enable mytopling-exporter.service
	systemctl restart mytopling-exporter.service
}

mytopling_exporter_config
mytopling_exporter_dir
start_mytopling_exporter
