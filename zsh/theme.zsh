_os_id=""
[ -r /etc/os-release ] && _os_id=$(. /etc/os-release && echo "$ID")

case "$_os_id" in
    fedora)
        # Fedora-inspired neon blue on black
        _C_ACCENT=$'%{\e[38;2;63;191;254m%}'
        _C_ACCENT2=$'%{\e[38;2;63;191;254m%}'
        _C_TEXT=$'%{\e[38;2;255;255;255m%}'
        _C_DIM=$'%{\e[38;2;128;128;128m%}'

        THEME_ACCENT="#3FBFFE"
        THEME_ACCENT2="#3FBFFE"
        THEME_TEXT="#FFFFFF"
        THEME_DIM="#808080"
        THEME_BG="#000000"
        THEME_BG_ALT="#1A1A1A"
        ;;
      endeavouros|*)
        # EndeavourOS purple/pink
        _C_ACCENT=$'%{\e[38;2;127;63;191m%}'
        _C_ACCENT2=$'%{\e[38;2;224;64;251m%}'
        _C_TEXT=$'%{\e[38;2;232;224;245m%}'
        _C_DIM=$'%{\e[38;2;107;47;160m%}'

        THEME_ACCENT="#7F3FBF"
        THEME_ACCENT2="#E040FB"
        THEME_TEXT="#E8E0F5"
        THEME_DIM="#6B2FA0"
        THEME_BG="#1A0A2E"
        THEME_BG_ALT="#0D0019"
        ;;
esac

_C_RESET=$'%{\e[0m%}'
_C_BOLD=$'%{\e[1m%}'

unset _os_id
