unconfined_services=$(audit2allow --all)
if [ -n "$unconfined_services" ]; then
# Print the unconfined services found during audit action
echo "Unconfined Services Found:"
echo "$unconfined_services"
# Suggest to assign security context or build policy for each service
echo "Recommendation: Assign a security context to each of the following unconfined services:"
while IFS= read -r line; do
echo "$line"
done <<< "$unconfined_services"
fi