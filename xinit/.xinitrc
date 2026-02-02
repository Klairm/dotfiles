#!/bin/sh
# Establecer variables de entorno
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export XDG_RUNTIME_DIR=/run/user/$(id -u)


if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

exec i3

