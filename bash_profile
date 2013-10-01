# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH



#Variable qui recupere l etat HA - exemple avec utilisation keepalived
#function VRRP_STATE { ip addr show em1 | grep -q "/32"; if [ $? == "0" ]; then echo "Active"; else echo "Standby"; fi; }

#Personnalisation du prompt
if [ `id -u` -eq 0 ]; then
        PS1='[\[$(tput bold)\]\[$(tput setaf 6)\]\A \[$(tput setaf 1)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 7)\]\h ] \[$(tput setaf 2)\]\w \[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]'
else
        PS1='[\[$(tput bold)\]\[$(tput setaf 6)\]\A \[$(tput setaf 4)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 7)\]\h ] \[$(tput setaf 2)\]\w \[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]'
fi



export PATH PS1

alias vi="vim"




# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi

#Fonction recuperant les seny SELinux en formattant la date => evite le date -d @1323121321
function sedenied () {
        if [ $# -eq 0 ]
        then
                grep deni /var/log/audit/audit.log | awk -F'[(:]' '{$2=strftime("(%Y/%m/%d-%Ih%Mm%Ss:",$2); print $0}'
        else
                grep deni /var/log/audit/audit.log.$1 | awk -F'[(:]' '{$2=strftime("(%Y/%m/%d-%Ih%Mm%Ss:",$2); print $0}'
        fi
}
