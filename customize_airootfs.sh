#!/usr/bin/env bash
# for package_to_compile in Hyprland; do # Create for-loop with list of package_to_compile
#     cd /usr/local/src/${package_to_compile}/ && make install 1>/dev/null
# done # End for-loop statement
# mkdir -p /usr/share/wayland-sessions; cp /usr/local/src/Hyprland/example/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop
sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen &>/dev/null # Generate the chosen locale
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                                Manage service                                │
# ╰──────────────────────────────────────────────────────────────────────────────╯
{
    enable_services=(
        # 'ly.service'
        'sddm.service'
        'NetworkManager.service'
        'systemd-resolved.service' 
        'systemd-networkd.service'
    ) # Declare local list
    disable_services=(
        'iwd.service'
        'sshd.service'
        'reflector.service'
        'vboxservice.service'
        'ModemManager.service'
        'choose-mirror.service'
        'qemu-guest-agent.service'
        'livecd-talk.service'
    ) # Declare local list
    systemctl --force enable ${enable_services[@]} 1>/dev/null # Enable services
    systemctl --force disable ${disable_services[@]} 1>/dev/null # Disable services 
}
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                               Add chaotic-aur                                │
# ╰──────────────────────────────────────────────────────────────────────────────╯
pacman-key --init # Ensure the keyring is properly initalized
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com 1>/dev/null
pacman-key --lsign-key FBA220DFC880C036 1>/dev/null 
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                              Change Permisions                               │
# ╰──────────────────────────────────────────────────────────────────────────────╯
chmod 755 --recursive /opt
chmod 700 --recursive /root/.local
chmod 755 --recursive /root/.config
chmod 700 --recursive /home/user/.local
chmod 755 --recursive /home/user/.config
chmod 755 --recursive /etc/zsh
chmod 755 --recursive /etc/X11
chmod 755 --recursive /etc/skel
chmod 755 --recursive /etc/xdg/nvim
chmod 755 --recursive /usr/local/bin
chmod 755 --recursive /etc/sddm.conf.d /etc/ly_conf
chmod 777 --recursive /etc/zsh/**/user-alias /etc/xdg/nvim/init.vim
chmod 755 /etc/{tmux.conf,securetty,locale.*,vconsole.conf,gitconfig,nanorc}
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                               Other operations                               │
# ╰──────────────────────────────────────────────────────────────────────────────╯
rm -rf /root/.local/share/zinit/completions
rm -rf /home/user/.local/share/zinit/completions
ln -sf /opt/craccken-installer/craccken-installer /usr/local/bin
rm -rf /etc/ly && mv -f /etc/ly_conf /etc/ly
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                             Create release file                              │
# ╰──────────────────────────────────────────────────────────────────────────────╯
{
    echo 'PRETTY_NAME="Craccken GNU/Linux 1.0.1"'
    echo 'NAME=Craccken'
    echo 'BUILD_ID=rolling'
    echo 'VERSION="1.0.1 Veronica"'
    echo 'VERSION_ID="1.0.1"'
    echo 'VERSION_CODENAME=veronica'
    echo 'ID=Craccken'
    echo 'ID_LIKE=arch'
    echo 'HOME_URL="https://github.com/Craccken/craccken-linux"'
    echo 'DOCUMENTATION_URL="https://github.com/Craccken/craccken-linux"'
    echo 'SUPPORT_URL="https://github.com/Craccken/craccken-linux"'
    echo 'BUG_REPORT_URL="https://github.com/Craccken/craccken-linux"'
} > /usr/lib/os-release
{
    echo "DISTRIB_CODENAME=veronica"
    echo "DISTRIB_ID=Craccken"
    echo "DISTRIB_RELEASE=1.0.1"
    echo "DISTRIB_DESCRIPTION='Craccken Linux'"
} > /etc/lsb-release
echo "Craccken Linux" > /etc/arch-release
