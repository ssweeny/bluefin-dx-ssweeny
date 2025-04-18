#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install pop-shell extension
dnf5 -y install \
    gnome-shell-extension-pop-shell \
    gnome-shell-extension-pop-shell-shortcut-overrides

# Install system76-firmware
dnf5 -y copr enable szydell/system76
dnf5 -y install \
    system76-firmware
dnf5 -y copr disable szydell/system76

systemctl enable system76-firmware-daemon
