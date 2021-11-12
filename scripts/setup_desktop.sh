#!/bin/bash 


# run script dir 

run_script_dir=~/arco_my_config/scripts


# return error message
error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

# ============== install the need program START ===============================


sudo pacman --noconfirm --needed -Sy dialog git || error "Error syncing the repos."


sh $run_script_dir/setup-our-git-credentials.sh 

sh $run_script_dir/git.sh 


welcome() { \
    dialog --colors --title "Installing arco_my_config!" --msgbox "\Z4This is a script that will install what I sarcastically call arcolinux_my_config .  It's really just an installation script for those that want to try out my . dot file  this script will only make it for arco linux DWM edition\\n\\n-Farook " 16 60

    dialog --colors --title "Stay near your computer!" --yes-label "Continue" --no-label "Exit" --yesno "\Z4This script is not allowed to be run as root, but you will be asked to enter your sudo password at various points during this installation. This is to give PACMAN the necessary permissions to install the software.  So stay near the computer.
    \\nThis script will be need 1 hour 45 minute to run it is really depending up on your internet speed." 8 60
}

welcome || error "User choose to exit."




sudo pacman -Syyu

# =========  
sudo pacman -S --needed --noconfirm nodejs npm composer gnome-characters gnome-calculator

# terminal 
sudo pacman -S --needed --noconfirm gnome-terminal konsole 

# ============= setup yay 
pushd ~/ 
git clone https://aur.archlinux.org/yay-git.git ~/yay
cd yay 
makepkg -si
popd



# =========== code editor ,ranger file manager,rsync file compare
sudo pacman -S  --needed --noconfirm gvim atom code neovim ranger rsync

# ========== screen capture video editor
sudo pacman -S --needed --noconfirm spectacle obs-studio kdenlive soundconverter


# subtitle editor 
sudo pacman -S --needed --noconfirm aegisub 

# mp3 tag editor 
yay -S puddletag-git

# google-chrome
pamac build google-chrome 

# brave browser
yay -S brave-bin 

# opensuse image writer
yay -S imagewriter 


# ============= cmus cannot be install if it found in zsh/site-functions ======
# remove _cmus* 
sudo rm -rf /usr/share/zsh/site-functions/_cmus*

# ============= youtube-dl cannot be install if it found in zsh/site-functions ======
# remove _youtube-dl 
sudo rm -rf /usr/share/zsh/site-functions/_youtube-dl

# gthumb image tools, cmus play song,youtube-dl download video from youtube
sudo pacman -S --needed --noconfirm gthumb cmus youtube-dl

# sticky note
sudo pacman -S --needed --noconfirm xpad knotes

#
sleep 5s

urxvt -e cmus &

# ocenaudio sound editor 
yay -S ocenaudio 

# install vlc
pamac install vlc


# sound player 
sudo pacman -S  --needed --noconfirm audacious amarok clementine

# install virt-manager 
sh $run_script_dir/install_virt-manager.sh

# install libreoffice 
sh $run_script_dir/install-libreoffice.sh



# ========================= Shutter ===========================================
# shutter is the screen capture ,
# shutter will not working if install using pacman 
# last edit 30 Oct 2021
# setup snap  
sh $run_script_dir/setup_snap.sh 

# then install shutter
sh $run_script_dir/install_shutter.sh

# =============================================================================
# ============== install the need program END =================================

# ============== copy config file START ======================================= 
tar_dir=~/arcolinux_my_config/CONFIG_FILES
config_des_dir=~/.config


# ====== copy vim,neovim,tmux,ranger,powerline config 
cp -r $tar_dir/vim/.vim ~/ 
cp -r $tar_dir/ranger/ ~/.config/ 
cp -r $tar_dir/powerline/ ~/.config/
cp -r $tar_dir/nvim/ ~/.config/

cp $tar_dir/vim/.vimrc ~/
cp $tar_dir/vim/.bashrc ~/
cp $tar_dir/vim/.tmux.conf ~/


# there is Error 403 when try to update system so I just comment out some line 
# in /etc/pacmna.d/mirrorlist file this help from getting Error 403
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old 
sudo cp $tar_dir/mirrorlist /etc/pacman.d/

# using flag --disable-download-timeout will help in case of slow connection 
sudo pacman -Syyu --disable-download-timeout


# rename pacman.conf file then copy pacman.conf file 
sudo mv /etc/pacman.conf /etc/pacman.conf.old
sudo cp $tar_dir/pacman.conf /etc/


# ====== copy dwm config file START ===========================================
old_dwm_config_dir=~/.config/arco-dwm/
if [[ -d $old_dwm_config_dir ]]; then
    mv ~/.config/arco-dwm ~/.config/arco-dwm.old/ 
fi

# copy the dwm config 
cp -r $tar_dir/arco-dwm $config_des_dir


# copy rofi config 
if [[ -d ~/.config/rofi ]]; then
    mv ~/.config/rofi ~/.config/rofi.old/ 
fi
cp -r $tar_dir/rofi/ $config_des_dir


pushd ~/.config/arco-dwm 
# remove the old config file 
sudo rm -rf config.h 
sleep 5s

sudo make clean install 
popd
# ====== copy dwm config file END =============================================


# ====== copy zsh config
pushd ~/

git clone https://gitlab.com/farookphuket/my_zsh.git 

# run the script from ~/my_zsh where just has clone
sh ~/my_zsh/setup_arco.sh


popd

echo "=========================== operation Complete =========================="
echo "current dir is $(pwd)"
echo " logout and log back in to get the new setup effect."
echo "Thank you for using Farook' s config script."
echo " please contact 'farookphuket@gmail.com' to report a problem about this script"
echo ""
echo "========================================================================="



sleep 5s

# ============== copy config file END ========================================= 

fn_googdbye(){
    dialog --colors --title "\Z7\ZbOperation done!" --msgbox "\Z4The operation has been done \\nPlease restart (you can press Mod+x then r to reboot)" 16 60
    
}

fn_googdbye
