audit_output=$(checksecure
--audit-ids
--policy-id=1.6.1.6
)
if [ -z "$audit_output" ]; then
echo "No unconfined daemons found."
else
echo "Unconfined daemons found:"
echo "$audit_output"
fi