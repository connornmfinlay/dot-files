# eww

Desktop resource widgets (X11 / XFCE).

    ln -s ~/dot-files/eww ~/.config/eww
    scripts/launch.sh   # or: eww daemon && eww open resources

`launch.sh` keeps the dashboard on the 34" ultrawide when it's connected
(falling back to the laptop panel) and reopens it when monitors are plugged
in or removed.

To start on login (XFCE autostart):

    ln -s ~/dot-files/eww/eww.desktop ~/.config/autostart/eww.desktop

Edit `eww.yuck` for layout/data, `eww.scss` for style. Reload with `eww reload`.
Requires the `eww` AUR package (X11 build, not `eww-wayland`).
