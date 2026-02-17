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
    printf '# crdeps\n'
    parseHelp ./bins/crdeps
    printf '\n\n# gentoo-go-license\n'
    parseHelp ./bins/gentoo-go-license
} > ./readme.md
