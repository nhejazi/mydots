alias open="xdg-open"
eval `systemctl --user enable ssh-agent`  # enable the ssh-agent
eval `systemctl --user start ssh-agent`   # start up the ssh-agent
ssh-add ~/.ssh/id_rsa                     # add keys to the running ssh-agent
i3                                        # start the i3 window manager
