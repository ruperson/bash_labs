#!/bin/bash
grep -E -r -s -h "^ACPI" var2/log/ > errors.log

grep -E -r -s -h "^.*[[:alnum:]]\.[[:alpha:]]" errors.log