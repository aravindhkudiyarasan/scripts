# Source global definitions
#if [ -f /etc/bashrc ]; then
#       . /etc/bashrc
####https://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
####yum install sl
###command usage= sl
#### for cmatrix rpm to download is cmatrix-1.2a-1.i386.rpm then yum install cmatrix-1.2a-1.i386.rpm
alias hack="cmatrix"
alias cowsay="cowsay I love coding"
alias up='service httpd start'
alias down='service httpd stop'
alias restart='service httpd restart'
alias ps='ps -ef |  grep -i java|grep -v grep;ps -ef |  grep -i docker|grep -v grep;ps -ef |  grep -i httpd|grep -v grep'
red=$(tput setf 4);
yellow=$(tput setf 2);
green=$(tput setf 5);
blue=$(tput setf 1);
bold=$(tput bold);
fawn=$(tput setaf 1); beige="$fawn";
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${red}\]\u";
PS1+="\[${blue}\] Working on ";
PS1+="\[${green}\]\w";
PS1+="\[${blue}\] @ ";
PS1+="\[${yellow}\]\h";
iS1+="\[${blue}\] <-- ";
PS1+="\n";
PS1+="\[${blue}\] --> \[${reset}\]";
export PS1;
#fi
