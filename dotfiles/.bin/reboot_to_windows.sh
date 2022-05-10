#!/bin/bash
sudo grub-reboot "$(grep -i windows /boot/grub/grub.cfg | cut -d"'" -f2 | head -n 1)" && sudo reboot
