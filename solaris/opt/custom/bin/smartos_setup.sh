#!/usr/bin/env bash
# Simple Ad Hoc SmartOS Setup Service
 
set -o xtrace
 
. /lib/svc/share/smf_include.sh
 
cd /
PATH=/usr/sbin:/usr/bin:/opt/custom/bin:/opt/custom/sbin; export PATH
 
case "$1" in
'start')
#### Insert code to execute on startup here.

cat <<EOF > /etc/TIMEZONE
TZ=Europe/Berlin
CMASK=022
LANG=en_US.UTF-8
EOF

export TZ=Europe/Berlin
/usr/sbin/rtc -c

    ;;

'stop')
    ### Insert code to execute on shutdown here.
    ;;
*)
    echo "Usage: $0 { start | stop }"
    exit $SMF_EXIT_ERR_FATAL
    ;;
esac
exit $SMF_EXIT_OK
