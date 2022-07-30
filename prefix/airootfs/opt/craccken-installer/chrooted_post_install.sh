#!/bin/env bash
new_user=$(grep "/home" /etc/passwd | cut -d: -f1 | head -1) # Get new user's username

is_installed_(){ # Create a function
    local pkgname="$1" && pacman -Q "$pkgname" >& /dev/null # Check if package installed
}

remove_if_installed_(){ # Create a function
    local pkgname # Declare local variable
    for pkgname in "$@"; do
        is_installed_ "$pkgname" && pacman -Rsn --noconfirm "$pkgname" # Remove package(s) if installed
    done # End for-loop statement
}

_manage_services(){ # Create a function
	local enable_services=('NetworkManager.service' 'sddm.service') # Create local list
	systemctl --force enable "${enable_services[@]}" # Enable services
	systemctl --force disable multi-user.target # Disable multi-user.target service
}

function _remove_vbox_pkgs(){
	local vbox_pkg='virtualbox-guest-utils' # Create local variable
    systemd-detect-virt | grep -i "oracle" >/dev/null # Check if running in vbox
    if [[ "$?" != 0 ]]; then # Check the return code if not 0(mean it is not running in vbox)
        remove_if_installed_ "$vbox_pkg" # Remove vbox package
    fi # End if-else statement
}

function _remove_vmware_pkgs(){ # Create a function
    local vmware_pkgs=('open-vm-tools' 'xf86-input-vmmouse' 'xf86-video-vmware') # Create local list 
    systemd-detect-virt | grep -i "vmware" >/dev/null # Check if running in vmware
    if [[ "$?" != 0 ]]; then # Check the return-code if not 0(mean it is not running in vmware)
        remove_if_installed_ "${vmware_pkgs[@]}" # Remove vmware packages
    fi # End if-else statement
}

_remove_qemu_pkgs(){ # Create a function
	local qemu_pkg='qemu-guest-agent' # Create local variable
    systemd-detect-virt | grep -i "qemu" >/dev/null # Check if running in vmware
    if [[ "$?" != 0 ]]; then # Check the return-code if not 0(mean it is not running in qemu)
        remove_if_installed_ "$qemu_pkg" # Remove qemu-guest package
    fi # End if-else statement
}

_remove_unwanted_graphics_drivers(){ # Create a function
	local gpu_file='/var/log/gpu-card-info.bash'
	local amd_card=''
	local amd_driver=''
	local intel_card=''
	local intel_driver=''
	# local nvidia_card=''
	# local nvidia_driver=''
    [[ -r "$gpu_file" ]] && source /var/log/gpu-card-info.bash

	# Remove AMD drivers
    if [[ -n "$(lspci -k | grep 'Advanced Micro Devices')" ]]; then
        amd_card=yes
    elif [[ -n "$(lspci -k | grep 'AMD/ATI')" ]]; then
        amd_card=yes
    elif [[ -n "$(lspci -k | grep 'Radeon')" ]]; then
        amd_card=yes
    fi
	[[ "$amd_card" == 'no' ]] && remove_if_installed_ xf86-video-amdgpu xf86-video-ati
    [[ "$intel_card" == 'no' ]] && remove_if_installed_ xf86-video-intel # Remove intel drivers
    # [[ "$nvidia_card" == 'no' ]] && remove_if_installed_ xf86-video-nouveau nvidia nvidia-settings nvidia-utils # Remove All nvidia drivers
	# [[ "$nvidia_driver" == 'yes' ]] && remove_if_installed_ xf86-video-nouveau # Remove nouveau drivers
}

_remove_unwanted_ucode(){ # Create a function
	cpu="$(grep -w "^vendor_id" /proc/cpuinfo | head -n 1 | awk '{print $3}')"
	case "$cpu" in
		GenuineIntel) remove_if_installed_ amd-ucode ;;
		*) remove_if_installed_ intel-ucode ;;
	esac
}

_remove_unwanted_packages(){ # Create a function
    local packages_to_remove=('mkinitcpio-archiso' 'lftp' 'testdisk' 'syslinux' 'archiso' 'memtest86+')
    pacman -Rnsc "${packages_to_remove[@]}" --noconfirm # Remove unnecessary packages
}

_clean_target_system(){ # Create a function
    local files_to_remove=( /etc/sudoers.d/02_g_wheel
        /etc/systemd/system/{etc-pacman.d-gnupg.mount,getty@tty1.service.d}
        /etc/systemd/system/getty@tty1.service.d/autologin.conf
        /etc/initcpio
        /etc/mkinitcpio-archiso.conf
        /etc/{group-,gshadow-,passwd-,shadow-}
        /etc/udev/rules.d/81-dhcpcd.rules
        /home/"$new_user"/{.xinitrc,.xsession,.xprofile,.wget-hsts,.screenrc,.ICEauthority}
        /var/lib/NetworkManager/NetworkManager.state
    )
    rm -rf "${files_to_remove[@]}" # Clean live ISO stuff from target system
    find /usr/lib/initcpio -name "archiso*" -type f -exec rm '{}' \;
}

_perform_various_stuff(){ # Create a function
	runuser -l "$new_user" -c 'xdg-user-dirs-update'
	runuser -l "$new_user" -c 'xdg-user-dirs-gtk-update'
    rm -rf /usr/local/share/craccken-installer
    sed -i 's/volatile/auto/g' /etc/systemd/journald.conf.d/volatile-storage.conf 2>>/tmp/.errlog
    sed -i 's/.*pam_wheel\.so/#&/' /etc/pam.d/su
}

_manage_services
_remove_vbox_pkgs
_remove_vmware_pkgs
_remove_qemu_pkgs
_remove_unwanted_graphics_drivers
_remove_unwanted_ucode
_remove_unwanted_packages
_clean_target_system
_perform_various_stuff
