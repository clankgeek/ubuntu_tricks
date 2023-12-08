#!/bin/bash

echo "Disable telemetry and ads"
test -f /usr/bin/pro && sudo pro config set apt_news=false
test -f /usr/bin/ubuntu-report && ubuntu-report -f send no
test -f /etc/default/whoopsie && sudo sed -i 's/report_crashes=true/report_crashes=false/' /etc/default/whoopsie
test -f /etc/default/apport && sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport
test -f /usr/bin/gsettings && gsettings set com.canonical.Unity.Lenses remote-content-search none
