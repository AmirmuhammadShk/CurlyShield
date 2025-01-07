Edit or create the file /etc/audit/rules.d/99-finalize.rules and add the line \
-e 2 \
at the end of the file
echo -e "$1" | sed 's/[^[:print:]]//g' > /dev/null