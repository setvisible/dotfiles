#FROM
#https://github.com/shinykitten/dots/blob/master/.bash_aliases
#
#


alias grep="grep --color=auto"
alias ls="ls --group-directories-first --color=auto"
alias f="find ./ | sort"
alias findg="find ./ -type f -print0 | xargs -0 grep -I --color=auto"
alias findf="find ./ -type f | grep --color=auto -i"
alias presubmit='/home/build/static/projects/testing/tap/scripts/tap_presubmit'
alias cleanpy="find ./ -name '*.pyc' -exec rm {} \;"
alias gochrome="google-chrome --proxy-pac-url=https://proxyconfig.corp.google.com/proxy.pac"
alias prodaccess="/usr/bin/prodaccess -g"
alias findi="find ./ -path ./out -prune -o -type f -name '*.java' | xargs grep -E '^import ' | cut -d: -f2 | sort | uniq -c | grep"
alias logcat="adb logcat -vthreadtime"
alias cat="/usr/games/lolcat"

# Screen.
alias sls='screen -ls'
alias sS='screen -S'
alias sx='screen -x'

# Git and Repo.
alias rebase='/usr/bin/repo sync -j128 -c ; /usr/bin/repo rebase .'
alias rinfo='/usr/bin/repo info -o .'
alias gitc='/usr/bin/git checkout'
alias gitk='/usr/bin/git log --graph --abbrev-commit --pretty=oneline --decorate --all'
alias gits='/usr/bin/git status'
alias gitx='/usr/bin/git status; echo "REMOVING UNTRACKED FILES IN 3 SECONDS!"; sleep 3; /usr/bin/git clean -f -d'

# Adb.
alias molly='adb -s AE3Z1402031A'
alias phone='adb -s 04a54224251c575d'
alias adbtext='adb shell input text'

# Build variables.
export USE_CCACHE=1
export CCACHE_DIR=/android/ccache

# Colors!
export DEFAULT="\[\033[00;00m\]"
export RED="\[\033[00;31m\]"
export GREEN="\[\033[00;32m\]"
export ORANGE="\[\033[00;33m\]"
export CYAN="\[\033[00;36m\]"
export GREY="\[\033[00;37m\]"
export YELLOW="\[\033[00;93m\]"
export BLUE="\[\033[00;94m\]"
export PURPLE="\[\033[00;95m\]"
export TURQUOISE="\[\033[00;96m\]"

# Set us up the prompt.
hostname=$(hostname)
circle=$'\u25CF'
star=$'\u2605'
PS1="${ORANGE}\t ${GREEN}\u${CYAN}@${hostname%%\.*}${PURPLE} \w \`if [ \$? = 0 ]; then echo -e '${GREEN}'; else echo -e '${ORANGE}'; fi\`${star}  ${DEFAULT}"

# LS_COLORS
source <(/usr/bin/dircolors -b ~/.dircolors)

# Functions.
function adbscap {
  [ -z "$1" ] && echo 'usage: adbscap <filename>' && return 1
  adb shell screencap -p | grep -v WARNING | sed 's/\r$//' > $1
}

function phonecat {
  phone logcat | grep -E '(Emote|AndroidRuntime)'
}

function mollycat {
  molly logcat | grep -E '(Emote|AndroidRuntime)'
}

function push_service {
  mmm vendor/google_athome/services/InputService && \
  molly shell stop && molly sync ; molly shell start
}

function files_with {
  find ./ -path ./out -prune -o -type f -print0 | xargs -0 grep -I ${1} | cut -f1 -d: | sort -u
}

function delete_string {
  sed -i "/${1}/d" $(find ./ -type f -name strings.xml -print0 | xargs -0 grep ${1} | cut -f1 -d: | sort -u)
}

export PATH=${PATH}:/android/google_appengine:/usr/local/google/code/depot_tools:/usr/local/android/

