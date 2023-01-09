#!/bin/bash

if [ "${check_if_include_config}" = "" ]; then
	source ./config.sh
fi

cur_path=$(cd $(dirname $0); pwd)

echo install mytopling_exporter
sh ${cur_path}/mytopling-exporter/uninstall_mytopling_exporter.sh
sh ${cur_path}/mytopling-exporter/install_mytopling_exporter.sh

echo install node_exporter
sh ${cur_path}/node-exporter/uninstall_node_exporter.sh
sh ${cur_path}/node-exporter/install_node_exporter.sh

echo install prometheus
sh ${cur_path}/prometheus/uninstall_prometheus.sh
sh ${cur_path}/prometheus/install_prometheus.sh

if [ "${enable_admin_dashboard}" != "false" ];then
	sh ${cur_path}/process_exporter/install_process_exporter.sh
fi

echo install grafana
sh ${cur_path}/grafana_rich/update_grafana.sh 
