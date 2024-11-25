#!/bin/sh
# Establecer variables de entorno
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

export XDG_RUNTIME_DIR=/run/user/$(id -u)

# Iniciar compositor (opcional)
# Si tienes problemas con gráficos o con la aceleración, puedes comentar esta línea
# Compton o picom
 picom & 

# Iniciar el entorno de escritorio (opcional)
# Si usas algún panel o barra (por ejemplo, polybar, dzen, etc.)
# polybar example &

# Iniciar gestor de ventanas



# Iniciar el servicio dbus
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

exec i3

