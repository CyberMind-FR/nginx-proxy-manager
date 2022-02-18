#!/usr/bin/with-contenv bash
# shellcheck shell=bash
set -e

mkdir -p /data/logs
sed-patch 's|<ADMIN_ACCESS_LOG>|/dev/null|' /etc/nginx/conf.d/production.conf
sed-patch 's|<ADMIN_ERROR_LOG>|/dev/null|' /etc/nginx/conf.d/production.conf
echo "Changing ownership of /data/logs to $(id -u):$(id -g)"
chown -R "$(id -u):$(id -g)" /data/logs

