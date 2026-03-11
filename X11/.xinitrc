systemctl --user import-environment DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY DBUS_SESSION_BUS_ADDRESS

i3
export GTK_THEME=Adwaita-dark
export QT_QPA_PLATFORMTHEME=gtk2
