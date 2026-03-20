#!/bin/sh

parseHelp(){
    foundHelp=false
    foundPrint=false
    while IFS='' read -r line; do
        case "$line" in
            'showHelp'*)
                ! "$foundHelp" && foundHelp=true
                ;;
            *'printf'*)
                "$foundHelp" && foundPrint=true
                ;;
            '\n"')
                "$foundPrint" && return
                ;;
            *)
                "$foundPrint" && printf '%s\n' "$line"
                ;;
        esac
    done < "$1"
}

{
    find ./bins -type f -executable | while IFS='' read -r line; do
        printf '# %s\n' "$(basename "$line")"
        parseHelp "$line"
        printf '\n\n'
    done
    # }
} > ./readme.md
