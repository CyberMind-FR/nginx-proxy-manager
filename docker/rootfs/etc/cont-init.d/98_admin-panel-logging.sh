#!/usr/bin/with-contenv sh
# shellcheck shell=bash


set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

log() {
    echo "[cont-init.d] $(basename "$0"): $*"
}
# Redirect admin panel logs from /dev/null to log files if enabled
if [ "${ADMIN_PANEL_LOG}" == "1" ] || [ "${ADMIN_PANEL_LOG}" -eq 1 ]; then
    log "Enabling admin dashboard logging"
    sed-patch 's|<ADMIN_ACCESS_LOG>|/data/logs/admin-panel_access.log standard|' /etc/nginx/conf.d/production.conf
    sed-patch 's|<ADMIN_ERROR_LOG>|/data/logs/admin-panel_error.log warn|' /etc/nginx/conf.d/production.conf
fi
