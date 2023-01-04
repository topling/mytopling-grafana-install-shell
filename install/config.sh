#!/bin/bash

grafana_admin_password=1234567
enable_admin_dashboard=false # false or anything

function server_config() {
    #server config
    mytopling_host=localhost
    mytopling_port=8000
    prometheus_port=9090
    prometheus_listen_port=9090
    mytopling_exporter_listen_address=9104
    prometheus_host=localhost
    grafana_host=localhost
    grafana_port=3000
}

function dell1_config() {
    #local config dell1
    mytopling_host=192.168.100.10
    mytopling_port=2011
    prometheus_port=55081
    prometheus_listen_port=10001
    mytopling_exporter_listen_address=9104
    prometheus_host=192.168.31.3
    grafana_host=localhost
    grafana_port=10002
}

function dell2_mysql_config() {
    #server config
    mytopling_host=localhost
    mytopling_port=8000
    prometheus_port=55351
    prometheus_listen_port=55351
    mytopling_exporter_listen_address=55353
    prometheus_host=192.168.31.2
    grafana_host=localhost
    grafana_port=55352
}

function check_user() {
	if test "$USER" != "root"; then
		echo ""
		echo "need root"
		echo ""
		exit
	fi
}


#server_config
#dell1_config
dell2_mysql_config

mytopling_host_port=${mytopling_host}:${mytopling_port}
prometheus_host_port=${prometheus_host}:${prometheus_port}

check_if_include_config="true"
