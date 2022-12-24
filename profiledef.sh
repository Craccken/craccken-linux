#!/bin/bash
# shellcheck disable=SC2034

iso_name="craccken"
iso_label="CRACCKEN_$(date +%Y%m)"
iso_publisher="Craccken Linux <https://github.com/Craccken/craccken-linux>"
iso_application="Craccken Linux"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-ia32.grub.esp' 'uefi-x64.grub.esp' 'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '17' '-b' '1M')
file_permissions=(
    ["/root"]="0:0:750"
    ["/etc/shadow"]="0:0:0400"
    ["/etc/gshadow"]="0:0:0400"
    ["/etc/doas.conf"]="0:0:0400"
    # ["/etc/sudoers"]="0:0:0440"
)
