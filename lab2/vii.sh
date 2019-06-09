#!/bin/bash
man bash | grep -o -i "[[:alnum:]]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r -n | head -3
