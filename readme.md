# crdeps
crdeps EBUILD_FILE_PATH LANGUAGE
EBUILD_FILE_PATH should be the ebuild file path; passed in as an argument
LANGUAGE should be the language that your trying to build the package for; passed in as an argument
supported langs are:
    - \`go\`
    - \`rust\`
in progress:
    - \`nim\`
future plans:
    - javashit stuff
    - ruby (if needed)
    - python
    - php (if needed)
This script uses the github cli to use github's release feature and upload the tarballs to it
It uses the DEPS_SCRIPT_REPO enviroment variable
If it's empty it tries to detect the remote link
If it detects the remote as ::gentoo it tries to use the DEPS_SCRIPT_GENTOO_REPO enviroment variable
Else if it detects the remote as ::guru it tries to use the DEPS_SCRIPT_GURU_REPO enviroment variable


# gentoo-go-license
gentoo-go-license <ebuildfile>

updates the LICENSE+= var
