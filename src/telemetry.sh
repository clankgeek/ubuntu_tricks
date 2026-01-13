#!/bin/bash

# Remove telemetry and ads

echo "Disable telemetry and ads"
command -v pro >/dev/null && sudo pro config set apt_news=false
command -v ubuntu-report >/dev/null && ubuntu-report -f send no
test -f /etc/default/whoopsie && sudo sed -i 's/report_crashes=true/report_crashes=false/' /etc/default/whoopsie
test -f /etc/default/apport && sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport
command -v gsettings >/dev/null && gsettings set com.canonical.Unity.Lenses remote-content-search none
