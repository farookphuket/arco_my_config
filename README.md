# CONFIG FOR ARCOlinux

[farook_banner]:https://i.ibb.co/5X0gkVF/farook-banner-1.png


![my banner][farook_banner]




## arcolinux_my_config

> I have install arcolinux on 14 Oct 2021 and try to learn 
> "how can I config the dwm" in the way I want it to.

> this config will work on the "Arcolinux dwm" 






---
## some preview 

[rofi_menu]:https://i.ibb.co/GvSycmB/rofi-menu-20211101.png





### rofi menu 

!["menu theme sidebar"][rofi_menu]


---





## Usge

> dear friend this is my personal config that I have setup to suit my need 
> in my use case of `dwm` on arco linux some of the key binding here maybe 
> will not going to make sense to you.

### ======== resize floating window =================

> `Mod+mouse right button click+drag` to resize the floating window size


### ======= all key binding 
> to see all of the key binding go to `~/.config/arco-dwm/sxhkd/sxhkdrc` 
> for example if you want to change key binding said Mod+Enter will spawn 
> `Alacritty terminal` but the teminal program you want to use is `Konsole` 
> instead to do this you have to do the below step.

1. delete file ~/.config/arco-dwm/config.h command 
`cd ~/.config/arco-dwm && sudo rm -rf config.h`

2. edit the file ~/.config/arco-dwm/sxhkd/sxhkdrc > search the line 
super + Return > change from `alacritty` to `konsole` command 
`cd ~/.config/arco-dwm/ && urxvt -e vim sxhkd/sxhkdrc`

3. recompile by using command `sudo make clean install` 

4. logout and log back in to take the effect DONE.


| Key Binding | Spawn 
|-- |--
| Mod + q | Kill the focusing open program window
| Mod+Enter | open alacritty terminal 
| Mod+F1 | Open Brave Browser
| Mod+F2 | Open Firefox
| Mod+F3 | Open Chromium
| Mod+F4 | Open Google Chrome
| Mod+d | Open rofi-menu
| Mod+h | Open htop
| Mod+m | Open cmus music player
| Mod+r | Open rofi-theme selector 
| Mod+Shift+r | reluanch dwm 
| Mod+v | open volume control
| Mod+x | For exit session logout
| Mod+Space | To change the window style tile,stack...
| Mod+b |  Toggle bar 
| Mod+h or Mod+l | resize window horizontal
| Mod+Up , Mod+Down , Mod+left , Mod+right | move ,change focus window 



| Mod+Shift | key mean
|-- |--
| Mod+Shift+d | Open d-menu
| Mod+Shift+Enter | Open ranger file 



| Floating Window | usge
|-- |--
| Mod+Mouse Button Right Drag | Resize floating window




| Ctrl + Alt + char | key mean 
|-- |--
| Ctrl + Alt + a | Open Application finder
| Ctrl + Alt + c | Open CatFish for search file 





--- 

# Issue today 

### ======================= Date 18 Oct 2021 no Conky 

> I cannot open conky at all after tried to find the way to to show emoji in 
> terminal 

> I did run `pacman -S noto-fonts-emoji-apple` follow by `fc-cache -v` then 
> reboot the machine again now conky is not run at all and my terminal still 
> cannot show emiji anyway. Ha Ha stupid me. 



## Issue has been fixed 

### ===================== Date 19 Oct 2021 Conky come back 

> install `noto-fonts-emoji-apple` can make `Conky` go die also cannot remove 
> `noto-fonts-emoji-apple` as `gnome-characters` needed so install `noto-fonts-emoji`
> instead using command `yay -S noto-fonts-emoji` then remove `noto-fonts-emoji-apple` 
> as they are conflick then reboot your system and Vola!!.

> Problem [Conky Die,Terminal cannot show Emoji] has been Solved!!


---

## last update


### Sun 17 Oct 2021
> reinstall arcolinux after false update 




### Sat 16 Oct 2021
> update installer script 

