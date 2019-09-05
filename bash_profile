source ~/.bashrc

# enables autocompletions with pyenv
eval "$(pyenv init -)"

# for system Python binaries like virtualenv
PATH=$PATH:/Users/osalpekar/Library/Python/2.7/bin

# setting JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
