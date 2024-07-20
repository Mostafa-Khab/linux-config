if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim
    set -gx PAGER less
    set -gx BROWSER chromium
    set -gx TERM xterm-256color
    set -gx TERM_PROGRAM xterm
    set -gx LESS -RiXj5
    set -gx PATH "$PATH:/opt/nvim-linux-64/bin"
    set -gx PDFVIEWER zathura
    set -gx MDVIEWER md-viewer
    set -gx WINEPATH '/usr/lib/gcc/x86_64-w64-mingw32/12-win32/;/usr/x86_64-w64-mingw32/local/bin/;/usr/x86_64-w64-mingw32/local/lib/'

    #colors for man(manual) pages
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

    #function fish_git_prompt 
    #  printf "$()"
    #end

    #function fish_prompt -d "write out the prompt"
    #  printf "in \033[35m$(dirs)\033[0m $(fish_git_prompt)\n\033[33m$USER\033[0m\$ "
    #end

    command /usr/local/bin/oh-my-posh init fish --config /home/sasa/Downloads/json/hunk.omp.json | source

    alias note='vifm /home/sasa/notes'
    alias bat='batcat'
    alias info='info --vi-keys'
    alias ccat='pygmentize -O style=gruvbox-dark -g'
    alias crack='objdump -d -M intel -C'
    alias gfx-proj='cp -r /home/sasa/Projects/opengl-template/* .'
    alias win32-gcc='i686-w64-mingw32-g++-win32 -I/usr/i686-w64-mingw32/local/include/ -L/usr/i686-w64-mingw32/local/lib/'
    alias win64-gcc='x86_64-w64-mingw32-g++-win32 -I/usr/x86_64-w64-mingw32/local/include/ -L/usr/x86_64-w64-mingw32/local/lib/'
    alias win32-crack='i686-w64-mingw32-objdump -d -M intel -C'
    alias win64-crack='x86_64-w64-mingw32-objdump -d -M intel -C'

    alias manpage="cp $HOME/Documents/def.1 ."
    alias exists='$HOME/Projects/learn/path_exists/./main'
    alias party="tmux splitw -h 'cmatrix' && tmux splitw 'pipes.sh'"
    alias edit-fish="vim $HOME/.config/fish/config.fish"
    alias nvim="/opt/nvim-linux64/bin/./nvim"
    alias mount_work='sudo mount -t auto -v /dev/sda1 /home/sasa/work'

    alias ide="tmux splitw -p 35 && clear"
    #alias build="tmux splitw -p 35 -c build 'make | less' && clear"
    #alias run="tmux splitw -p 35 -c build './main'"

    alias fuck="clear && echo you idiot, stop cursing me, you are the only fool!!"
    alias fuckoff="sudo shutdown -P +0"
    alias cmake_mingw64="cmake -DCMAKE_TOOLCHAIN_FILE=/home/sasa/glfw-3.3.9/CMake/x86_64-w64-mingw32.cmake"
    alias cmake_mingw32="cmake -DCMAKE_TOOLCHAIN_FILE=/home/sasa/glfw-3.3.9/CMake/i686-w64-mingw32.cmake"
    alias ls="ls --group-directories-first --color=always"
end
