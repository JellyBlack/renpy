#!/bin/bash

cd $(dirname $(dirname $(readlink -f $0)))

nice lib/py3-linux-x86_64/python add.py "$@"
nice lib/py2-linux-x86_64/python add.py "$@"
