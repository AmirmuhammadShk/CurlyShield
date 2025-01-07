update_crypto_policy() {
local policy=$1
case $policy in
DEFAULT) echo "DEFAULT" ;;
* ) echo "Invalid crypto policy. Use one of the following: DEFAULT" >&2; exit 1;;
esac
}
update_crypto_policy DEFAULT
update-crypto-policies