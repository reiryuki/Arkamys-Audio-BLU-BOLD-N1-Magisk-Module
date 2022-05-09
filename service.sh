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

# aml fix
DIR=$AML/system/vendor/odm/etc
if [ -d $DIR ] && [ ! -f $AML/disable ] && [ "$API" -ge 26 ]; then
  chcon -R u:object_r:vendor_configs_file:s0 $DIR
fi

# mount
NAME="*audio*effects*.conf -o -name *audio*effects*.xml -o -name *policy*.conf -o -name *policy*.xml"
if [ ! -d $AML ] || [ -f $AML/disable ]; then
  DIR=$MODPATH/system/vendor
else
  DIR=$AML/system/vendor
fi
FILE=`find $DIR/etc -maxdepth 1 -type f -name $NAME`
if [ `realpath /odm/etc` == /odm/etc ] && [ "$FILE" ]; then
  for i in $FILE; do
    j="/odm$(echo $i | sed "s|$DIR||")"
    if [ -f $j ]; then
      umount $j
      mount -o bind $i $j
    fi
  done
fi
if [ -d /my_product/etc ] && [ "$FILE" ]; then
  for i in $FILE; do
    j="/my_product$(echo $i | sed "s|$DIR||")"
    if [ -f $j ]; then
      umount $j
      mount -o bind $i $j
    fi
  done
fi
if ( [ `realpath /odm/etc` == /odm/etc ] && [ "$FILE" ] )\
|| ( [ -d /my_product/etc ] && [ "$FILE" ] ); then
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


