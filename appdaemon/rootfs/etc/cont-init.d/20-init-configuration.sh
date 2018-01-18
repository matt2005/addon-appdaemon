#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: AppDaemon
# Creates initial AppDaemon configuration in case it is non-existing
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if ! hass.directory_exists '/config/appdaemon'; then
    cp -R /root/appdaemon /config/appdaemon \
        || hass.die 'Failed to create initial AppDaemon configuration'
fi

case "$(hass.config.get 'appdaemon_version')" in
    3.*
        mv /config/appdaemon/apps.yaml /config/appdaemon/apps/ \
        || hass.die 'Failed to Move apps.yaml to apps folder'
esac
