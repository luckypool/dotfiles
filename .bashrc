export PS1='\[\033[32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\W\[\033[0m\]\$ '

# for ls -G
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=$PATH:/usr/local/sbin
export PATH=/Users/luckypool/local/bin:$PATH

# perlbrew
source ~/.perlbrew/etc/bashrc

# TeX
export PATH=$PATH:/Applications/UpTeX.app/teTeX/bin

# MAMP
export PATH=/Applications/MAMP/Library/bin:$PATH

# CPANM
alias cpanm-outdated='cpan-outdated | cpanm'

