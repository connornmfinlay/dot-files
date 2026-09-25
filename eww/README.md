# eww

Desktop resource widgets (X11 / XFCE).

    ln -s ~/dot-files/eww ~/.config/eww
    eww daemon && eww open resources

To start on login (XFCE autostart):

    ln -s ~/dot-files/eww/eww.desktop ~/.config/autostart/eww.desktop

Edit `eww.yuck` for layout/data, `eww.scss` for style. Reload with `eww reload`.
Requires the `eww` AUR package (X11 build, not `eww-wayland`).
