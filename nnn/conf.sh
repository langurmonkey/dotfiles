#!/bin/bash
export NNN_OPTS='cE'
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_BMS='D:~/Documents;P:~/Projects'
export NNN_COLORS='12345678'
export NNN_ARCHIVE='\\.(7z|bz2|gz|tar|tgz|zip)$'
export NNN_PLUG='f:fzz;t:preview-tabbed;p:preview-tui;d:diffs;v:imgview;m:mediainf'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS="a5a02177fb2121f7c6d6abc4"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

