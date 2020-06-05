alias open="xdg-open"
systemctl --user enable ssh-agent         # enable the ssh-agent
systemctl --user start ssh-agent          # start up the ssh-agent
ssh-add ~/.ssh/id_rsa                     # add keys to the running ssh-agent
