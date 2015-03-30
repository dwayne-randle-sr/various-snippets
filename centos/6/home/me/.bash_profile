# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#Python sepcific settings
export PYTHONSTARTUP=~/various-snippets/python/startup/pythonstartup.py

# OS Tools settings
export GREP_OPTIONS='--color=always'

# Bash Completion
if [ -f /etc/bash_completion.d/django_bash_completion ] ; then
    source /etc/bash_completion.d/django_bash_completion
fi
