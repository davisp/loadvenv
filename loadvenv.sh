# Load a virtualenv as a subshell
#
# Copy this file to somewhere like ~/.loadvenv.sh and then
# place after your `source /path/to/virtualenvwrapper.sh` add
# a line like:
#
# source ~/.loadvenv.sh
#
# Usage: loadenv [environment_name]
#

function loadenv () {
    typeset env_name="$1"
    if [ "$env_name" = "" ]
    then
        virtualenvwrapper_show_workon_options
        return 1
    fi

    virtualenvwrapper_verify_workon_home || return 1
    virtualenvwrapper_verify_workon_environment $env_name || return 1
    
    activate="$WORKON_HOME/$env_name/bin/activate"
    if [ ! -f "$activate" ]
    then
        echo "ERROR: Environment '$WORKON_HOME/$env_name' does not contain an activate script." >&2
        return 1
    fi
    
    LOADENV_LOADING="$env_name"

    # Execute our subshell
    $SHELL -i
    
    return 0
}

# loadenv recursing. Do hook things.
if [ -n "$LOADENV_LOADING" ]; then
    activate="$WORKON_HOME/$env_name/bin/activate"

    # Recheck just in case
    if [ ! -f "$activate" ]
    then
        echo "ERROR: Environment '$WORKON_HOME/$env_name' does not contain an activate script." >&2
        return 1
    fi

    virtualenvwrapper_run_hook "$WORKON_HOME/preactivate"
    virtualenvwrapper_run_hook "$WORKON_HOME/$env_name/bin/preactivate"
    
    source "$activate"
fi


