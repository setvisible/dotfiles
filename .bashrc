# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PATH=$PATH:~/Programmes:~/Scripts

# ====================================================
#                        HELP
# ====================================================
# -t <flag> = test if the terminal has standard output:
# Flags:
#  - 0 = stdin
#  - 1 = stdout
#  - 2 = stderr
#
if [ -t 1 ] ; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo " Do you need help ? type helpme"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
fi

helpme() {
if [[ $1 == "-d" ]]; then
    echo ".:.:. Directories .:.:."
    echo
    echo
elif [[ $1 == "-f" ]]; then
    echo ".:.:. Custom Functions List .:.:."
    echo "  bdf         See Nastran files in current Dir"
    echo "  cdd         Go to Dir + see content (eq. cd & dir)"
    echo "  nasfind     DAT research"
    echo "  dr          See Current Directory"
    echo "  h           History"
    echo "  hg <opt>    Search <opt> in History "
    echo "  pss         User's ps"
    echo "  topme       User's top"
    echo
elif [[ $1 == "-b" ]]; then
    echo ".:.:.LSF - Load Sharing Facility .:.:."
    echo "  bjobs"
    echo "  "
    echo "  bhist               // Displays information about your own pending, running and suspended jobs."
    echo "  bhist -a            // Displays information about both finished and unfinished jobs. "
    echo "  bhist -l 2497731    // Displays information in long format of Job ID=2497731."
    echo "  bhist -w            // Displays information wide format. "
    echo "  "
    echo "  bpeek"
    echo "  bpeek 2497731"
    echo "  "
    echo "  bhosts              // List the hosts and the queues"
    echo "  bqueues -l"
    echo "  busers"
    echo "  bwhatzup            // List all running jobs"
    echo "  "
else
    echo "helpme [-d] [-f] [-n] [-b]"
    echo "   -d    Directories"
    echo "   -f    Custom Functions"
    echo "   -b    LSF"
    echo
fi
}


# ====================================================
#                   GENERIC ALIAS
# ====================================================
# (alphabetical order)

#alias bdf="clear ; ls *.nas *.pch *.dat *.bdf *.xdb *.op2 *.f06 -l"
alias bdf='dir -N1 --color=always *.[nN][aA][sS] *.[pP][cC][hH] *.[dD][aA][tT] *.[bB][dD][fF] *.[xX][dD][bB] *.[oO][pP]2 *.[fF]06 2>/dev/null'

# (!) rename "SERVER_x_NAME" in the command below
bwhatzup() {
   echo "========== SERVER 1 =========="
   bjobs -q SERVER_1_NAME -u all -w
   echo
   echo "========== SERVER 2 =========="
   bjobs -q SERVER_2_NAME -u all -w
   # ...
}

cdd() {
    cd "$*"
    clear
    ls -alh -p --color=always
}

alias dr="clear ; ls -alh -p --color=always"

alias ls='ls --group-directories-first --color=auto'

alias pss="ps -e -o pid,ppid,time,user,cmd | grep $USER"
alias psme="ps -e -o user,pid,ppid,time,cmd | grep $USER"

alias h="history"
alias hgrep="history | grep --color=always"

alias topme="top -u $USER"


# ====================================================
#                      MY TOOLS
# ====================================================
alias nasfind=~/nastranfind/nastranfind
alias pch2csv=~/pch2csv/pch2csv


# ====================================================
#                   3rd PARTY TOOLS
# ====================================================
# NASTRAN
#
# Warning! Nastran v2014 removed 'news' argument?
# alias nastran="nastran news=no"
#
#
# GENESIS
#Run GENESIS directly by executing the genesis script
#(e.g., genesis mymodel.dat)
alias genesis=/software/genesis/751/vrand/bin/genesis




