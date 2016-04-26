#!/usr/bin/bash
set -euo pipefail
IFS=$'\n\t'

# make sure we have the src directory
if [ ! -d "/src" ]; then
    echo "Please add source as a volume at /src"
fi

cd /src

command=${1:-}
case "$command" in
    build)
        hammer build
        ;;
    test)
        section=${2:-}
        name=$(hammer query '{{.Name}}')
        case "$section" in
            install)
                yum install -y out/${name}*.rpm
                yum remove -y $name
                ;;
            *)
                echo "usage: $0 test SECTION"
                echo 'try "install"'
                exit 1
                ;;
        esac
        ;;
    *)
        echo "usage: $0 COMMAND"
        echo 'try "build" or "test"'
        exit 1
        ;;
esac
