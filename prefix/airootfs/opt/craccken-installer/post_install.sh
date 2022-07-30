#!/bin/env bash
chroot_path='/mnt'
run_command_in_mountpoint(){ # Create a function 
    chroot "$chroot_path" /bin/bash -c "${1}" # Run shell command to mountpoint. Use chroot not arch-chroot
}  

gpu_file=$chroot_path/var/log/gpu-card-info.bash
function detect_vga_drivers(){ ## Detect drivers in use in live session
    local card=no
    local driver=no
    if [[ -n "$(lspci -k | grep -P 'VGA|3D|Display' | grep -w "$2")" ]]; then
        card=yes
        if [[ -n "$(lsmod | grep -w $3)" ]]; then
            driver=yes
        fi
        if [[ -n "$(lspci -k | grep -wA2 "$2" | grep 'Kernel driver in use: $3')" ]]; then
            driver=yes
        fi
    fi # End if-else statement
    echo "${1}_card=$card"     >> ${gpu_file}
    echo "${1}_driver=$driver" >> ${gpu_file}
}
detect_vga_drivers 'amd' 'AMD' 'amdgpu' # Detect AMD
detect_vga_drivers 'intel' 'Intel Corporation' 'i915' # Detect Intel
# detect_vga_drivers 'nvidia' 'NVIDIA' 'nvidia' # Detect Nvidia
cat ${gpu_file}
