if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim
    set -gx PAGER less
    set -gx BROWSER chromium
    set -gx TERM xterm-256color
    set -gx TERM_PROGRAM xterm
    set -gx LESS -RiXj5
    set -gx PATH "$PATH:/opt/nvim-linux-64/bin"

    #colors for man pages
    set -x LESS_TERMCAP_mb (set_color brcyan)
    set -x LESS_TERMCAP_md (set_color brcyan)
    set -x LESS_TERMCAP_me (set_color yellow)
    set -x LESS_TERMCAP_se (set_color normal)
    set -x LESS_TERMCAP_so (set_color -b brwhite black)
    set -x LESS_TERMCAP_ue (set_color cyan)
    set -x LESS_TERMCAP_us (set_color brred)

    bind -M insert \cf accept-autosuggestion

    if not set -q TMUX
      exec tmux
    end

    #NOTE: you need to install oh my posh (change if required [[likely]])
    #command /usr/local/bin/oh-my-posh init fish --config $HOME/.config/oh-my-posh-theme/hunk.omp.json | source

    alias note='vifm /home/sasa/notes'
    alias bat='batcat'
    alias info='info --vi-keys'
    alias ccat='pygmentize -O style=gruvbox-dark -g'
    alias crack='objdump -d -M intel -C'

    #some customizations for my workflow
    #alias gfx-proj='cp -r /home/sasa/Projects/opengl-template/* .'
    #alias win32-gcc='i686-w64-mingw32-g++-win32'
    #alias win32-crack='i686-w64-mingw32-objdump -d -M intel -C'

    #alias exists='$HOME/Projects/learn/path_exists/./main'
    alias party="tmux splitw -h 'cmatrix' && tmux splitw 'pipes.sh'"
    alias edit-fish="vim $HOME/.config/fish/config.fish"
    alias nvim="/opt/nvim-linux64/bin/./nvim"

    alias ide="tmux splitw -p 35 && clear"
    alias build="tmux splitw -p 35 -c build 'make | less'"
    alias run="tmux splitw -p 35 -c build './main'"

    #DO NOT TRY TO HAVE SUCH BAD HABITS!!
    #alias fuck="clear && echo you idiot, stop cursing me, you are the only fool!!"
    #alias fuckoff="sudo shutdown -P +0"
end
