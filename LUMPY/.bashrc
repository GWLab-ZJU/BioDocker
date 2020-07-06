__conda_setup="$('$HOME/miniconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda2/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda2/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda2/bin:$PATH"
    fi
fi
