(

MODPATH=${0%/*}
API=`getprop ro.build.version.sdk`
AML=/data/adb/modules/aml

# debug
exec 2>$MODPATH/debug.log
set -x

# function
restart_audioserver() {
if [ "$API" -ge 24 ]; then
  killall audioserver
else
  killall mediaserver
fi
}

# restart
restart_audioserver

# wait
sleep 20

# mount
NAME="*audio*effects*.conf -o -name *audio*effects*.xml -o -name *policy*.conf -o -name *policy*.xml"
if [ ! -d $AML ] || [ -f $AML/disable ]; then
  DIR=$MODPATH/system/vendor
else
  DIR=$AML/system/vendor
fi
FILE=`find $DIR/odm/etc -maxdepth 1 -type f -name $NAME`
if [ "`realpath /odm/etc`" != /vendor/odm/etc ] && [ "$FILE" ]; then
  for i in $FILE; do
    j="$(echo $i | sed "s|$DIR||")"
    umount $j
    mount -o bind $i $j
  done
  restart_audioserver
fi
if [ ! -d $AML ] || [ -f $AML/disable ]; then
  DIR=$MODPATH/system
else
  DIR=$AML/system
fi
FILE=`find $DIR/etc -maxdepth 1 -type f -name $NAME`
if [ -d /my_product/etc ] && [ "$FILE" ]; then
  for i in $FILE; do
    j="$(echo $i | sed "s|$DIR||")"
    umount /my_product$j
    mount -o bind $i /my_product$j
  done
  restart_audioserver
fi

# wait
sleep 40

# grant
PKG=com.arkamys.audio
pm grant $PKG android.permission.READ_PHONE_STATE
if [ "$API" -ge 30 ]; then
  appops set $PKG AUTO_REVOKE_PERMISSIONS_IF_UNUSED ignore
fi

) 2>/dev/null


