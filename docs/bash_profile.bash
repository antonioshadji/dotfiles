. .bashrc
echo "processed .bash_profile"
if tmux has-session -t $(hostname)
then
	if [[ -z "$TMUX" ]]; then
		tmux attach
		echo "tmux attached to session $(hostname)"
	else
		tmux switch-client -t $(hostname)
		echo "switched to tmux session $(hostname)"
	fi
else
	tmux new -s $(hostname)
	echo "created new tmux session $(hostname)"
fi
