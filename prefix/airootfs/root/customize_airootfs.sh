#!/usr/bin/env bash
sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen &>/dev/null # Generate the chosen locale
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                                Manage service                                │
# ╰──────────────────────────────────────────────────────────────────────────────╯
{
    enable_services=(
        'ly.service'
        # 'sddm.service'
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
pacman-key --populate archlinux
pacman -S archlinux-keyring

rm -rf /root/.local/share/zinit/completions
rm -rf /home/user/.local/share/zinit/completions
ln -sf /opt/craccken-installer/craccken-installer /usr/local/bin
rm -rf /etc/ly && mv -f /etc/ly_conf /etc/ly
# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                             Create release file                              │
# ╰──────────────────────────────────────────────────────────────────────────────╯
{
    echo 'NAME=Craccken Linux'
    echo 'PRETTY_NAME="Craccken GNU/Linux"'
    echo 'ID=Craccken'
    echo 'BUILD_ID=rolling'
    echo 'HOME_URL="https://github.com/Craccken/craccken-linux"'
    echo 'DOCUMENTATION_URL="https://github.com/Craccken/craccken-linux"'
    echo 'SUPPORT_URL="https://github.com/Craccken/craccken-linux"'
    echo 'BUG_REPORT_URL="https://github.com/Craccken/craccken-linux"'
    echo 'ID_LIKE=arch'
} > /usr/lib/os-release
{
    echo "DISTRIB_ID=Craccken"
    echo "DISTRIB_RELEASE=rolling"
    echo "DISTRIB_DESCRIPTION='Craccken Linux'"
} > /etc/lsb-release
echo "Craccken Linux" > /etc/arch-release
