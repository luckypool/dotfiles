export PS1='\[\033[32m\]\u@\h\[\033[0m\]:\[\033[34m\]\W\[\033[0m\]\$ '

# for ls -G
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=$PATH:/usr/local/sbin
export PATH=/Users/luckypool/local/bin:$PATH

# TeX
export PATH=$PATH:/Applications/UpTeX.app/teTeX/bin

# MAMP
export PATH=/Applications/MAMP/Library/bin:$PATH

# CPANM
alias cpanm-outdated='cpan-outdated | cpanm'

# perlbrew
source ~/.perlbrew/etc/bashrc

