#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install the CachyOS Kernel
dnf remove -y kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra kernel-uki-virt
dnf -y copr enable bieszczaders/kernel-cachyos
dnf install -y kernel-cachyos-server
dnf -y copr disable bieszczaders/kernel-cachyos

# Install CachyOS Kernel Addons
dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf install -y cachyos-ksm-settings scx-manager scx-scheds
dnf -y copr disable bieszczaders/kernel-cachyos-addons

# Generate initramfs
QUALIFIED_KERNEL="$(rpm -qa | grep -P 'kernel-cachyos-server-(\d+)' | sed -E 's/kernel-cachyos-server-//')"
dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/lib/modules/$QUALIFIED_KERNEL/initramfs.img" --omit-drivers zfs
chmod 0600 /lib/modules/$QUALIFIED_KERNEL/initramfs.img

systemctl enable podman.socket
