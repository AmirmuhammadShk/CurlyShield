if [ -d /home/$USER ]; then
# User already has a home directory, do nothing
else
# Create the home directory and set the owner to the current user
mkdir -m 700 /home/$USER
# If this is the first time the user is created, add the /home/$USER/.nologin file
if [ ! -f "/home/$USER/.nologin" ]; then
touch /home/$USER/.nologin
fi
fi