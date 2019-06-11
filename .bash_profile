# OPAM configuration
. /home/fulgjon/opam-coq.8.8.2/opam-init/init.sh > /dev/null 2> /dev/null || true
if [ -e /home/fulgjon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/fulgjon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
