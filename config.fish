if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim
    set -gx PAGER less
    set -gx BROWSER chromium
    set -gx TERM xterm-256color
    set -gx TERM_PROGRAM xterm
    set -gx LESS -RiXj5
    set -gx PATH "$PATH:/opt/nvim-linux-64/bin"

    bind -M insert \cf accept-autosuggestion

    if not set -q TMUX
      exec tmux
    end

    function fish_git_prompt 
      printf "$($HOME/Projects/learn/path_exists/git-branch/./main)"
    end

    function fish_prompt -d "write out the prompt"
      printf "\033[33m$USER\033[0m in \033[35m$(dirs)\033[0m $(fish_git_prompt)\n\033[01;36m$USER\033[0m: "
    end


    alias note='vifm /home/sasa/notes'
    alias bat='batcat'
    alias info='info --vi-keys'
    alias ccat='pygmentize -O style=gruvbox-dark -g'
    alias crack='objdump -d -M intel -C'
    alias gfx-proj='cp -r /home/sasa/Projects/opengl-template/* .'
    alias win32-gcc='i686-w64-mingw32-g++-win32'
    alias win32-crack='i686-w64-mingw32-objdump -d -M intel -C'

    alias exists='$HOME/Projects/learn/path_exists/./main'
    alias party="tmux splitw -h 'cmatrix' && tmux splitw 'pipes.sh'"
    alias edit-fish="vim $HOME/.config/fish/config.fish"
    alias nvim="/opt/nvim-linux64/bin/./nvim"

    alias ide="tmux splitw -p 35 && clear"
    alias build="tmux splitw -p 35 -c build 'make | less'"
    alias run="tmux splitw -p 35 -c build './main'"

    alias fuck="clear && echo you idiot, stop cursing me, you are the only fool!!"
    alias fuckoff="sudo shutdown -P +0"
end
