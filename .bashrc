#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=-1
HISTFILESIZE=-1

# Because who doesnt need these
shopt -s autocd
shopt -s histappend

## Now I could explain what this command right here does
## However It would be more EDUCATIONAL if you googled it yourself
## Asshole
## -Hulusi of the past

PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Basic Commands
alias rm='rm -Ri'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='vim'
alias s='sudo'
alias cp='cp -rv'
alias mv='mv -v'

# Makes life easier
alias sl='sudo leafpad'
alias sv='sudo vim'
alias pa='sudo pacman'
alias sn='shutdown now'
alias rb='reboot'
alias gc='git clone'
alias pm='pulsemixer'
alias IntelliJ='/usr/bin/idea %f'
alias burn='function _burn(){ sudo dd bs=4M if=$1 of=$2 status=progress oflag=sync; };_burn'

##Finish this later fatass
alias giveguest='f() { sudo cp -r "$1" /home/guest/ && sudo chown -R guest:guest /home/guest/$(basename "$1"); unset -f f; }; f'

#Dont really need these
alias chx='chmod +x'
##The fuck pa -Ss
alias fuck='sudo $(history -p '!!')'
alias torrent='transmission-gtk'
alias solitaire='ttysolitaire'
alias sizeof='du --summarize --human-readable'
alias testmp4='ffmpeg -f lavfi -i testsrc=duration=9:size=640x480:rate=30 test.mp4'

#Functions
function wallpaper() {
    file_name="$1"
    full_path=$(find /home/hulusi/Wallpapers -type f -name "$file_name")

    if [ -n "$full_path" ]; then
        xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace2/last-image -s "$full_path" && sudo magick convert "$full_path" -set colorspace RGB -format png -blur 0x8 /usr/share/backgrounds/background.png
    else
        echo "File not found: $file_name"3
    fi
}

monochrome() {
    vibrant-cli "$1" 0
}

polychrome() {
    vibrant-cli "$1" 1
}




#Going back files
alias .1='../'
alias .2='../../'
alias .3='../../../'

##BEST PSI NO QUESTIONS ASKED
#PS1='\[\e[0;1;97m>\[\e[0;1;96m\]>\[\e[0;1;94m\]> \[\e[0m\]'

##Not as clean but dont wanna fuck up like last time
PS1='\[\e[0;97m\]\W \[\e[1;97m\]>\[\e[0;1;96m\]>\[\e[0;1;94m\]> \[\e[0m\]'

##GOD PLEASE BE ON MY SIDE
umask 022

