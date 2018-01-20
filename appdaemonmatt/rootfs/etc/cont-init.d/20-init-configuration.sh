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

case "$(hass.config.get 'version')" in
    3.*)
        echo "Appdaemon version 3"
        if [ -f /config/appdaemon/apps.yaml ];then
            mv /config/appdaemon/apps.yaml /config/appdaemon/apps/
        fi
        ;;
esac
echo "Installing appdaemon $(hass.config.get 'version')"
pip3 install appdaemon=="$(hass.config.get 'version')"

