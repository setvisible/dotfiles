# How can I install and setup Powerline for different applications and shells in Ubuntu?

**Powerline** is a plug-in to display informational and beautiful statusline for `vim`, `tmux` and shell prompt for `bash`, `zsh`.

[Powerline Documentation](https://powerline.readthedocs.org/en/latest/index.html)

**Vim** statusline:

![](screenshots/powerline1.png)
![](screenshots/powerline2.png)
![](screenshots/powerline3.png)
![](screenshots/powerline4.png)


## Plugin Installation:

Install `python-pip` and `git`: Open terminal by hitting `Ctrl+Alt+T` and run:

    sudo apt-get install python-pip git

 - Per user:

    In terminal run:

        pip install --user git+git://github.com/Lokaltog/powerline

    Add `~/.local/bin` to `$PATH` by modifying `~/.profile` with your favourite editor:

        gksudo gedit ~/.profile

    and adding following lines at the end of it:

        if [ -d "$HOME/.local/bin" ]; then
            PATH="$HOME/.local/bin:$PATH"
        fi

 - System wide:

    In terminal run:

        su -c 'pip install git+git://github.com/Lokaltog/powerline'

## Font Installation:

Powerline provides two ways of installing the required fonts. If you're using one of following terminal: `Gnome Terminal`, `Konsole`, `lxterminal`, `st`, `Xfce Terminal`, `Terminator`, `Guake`, `Yakuake` then you should use *"Fontconfig"* method.

### Fontconfig: (recommended)

 - Per User:

    Run the following commands in terminal:

        wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
        mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
        fc-cache -vf ~/.fonts
        mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

 - System wide:

    Run the following commands in terminal:

        wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
        sudo mv PowerlineSymbols.otf /usr/share/fonts/
        sudo fc-cache -vf
        sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

### Patched font:

Use this method only if *"Fontconfig"* method doesn't work for you or you're using a terminal other than mentioned above.

1. Download the font of your choice from powerline-fonts.
2. Move your patched font to `~/.fonts/` for per user installation or `/usr/share/fonts` for system wide installation.
3. Run `fc-cache -vf ~/.fonts` to update your font cache, or `sudo fc-cache -vf` to do it system wide.

To use patched font in `Gvim` see this [answer](https://askubuntu.com/a/3532/37006 "https://askubuntu.com/a/3532/37006") and to change the font of your respective terminal check this question: [How to change the font of various terminal emulators?](https://askubuntu.com/q/283830/37006 "https://askubuntu.com/q/283830/37006"). You may have to reboot your system after font installation for changes to take effect.

## Usage: (for per user installation)

- Vim statusline:

    Add following to your `~/.vimrc` or `/etc/vim/vimrc`:

        set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
        
        " Always show statusline
        set laststatus=2
        
        " Use 256 colours (Use this setting only if your terminal supports 256 colours)
        set t_Co=256

 - Bash prompt:

    Add the following line to your `~/.bashrc` or `/etc/bash.bashrc`:

        if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
            source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
        fi

 - Zsh prompt:

    Add the following line to your `~/.zshrc` or `/etc/zsh/zshrc`:

        if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
            source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
        fi

 - Tmux statusline:

    Add the following line to your `~/.tmux.conf`:

        source ~/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
        set-option -g default-terminal "screen-256color"

    If your terminal supports 256 colours, set `TERM` environment variable to xterm-256color by modifying `~/.bashrc` or `/etc/bash.bashrc` and adding following line:

        export TERM=xterm-256color

    To check if your terminal supports 256 colours check the documentation of your terminal or google it.
    Most popular terminals support 256 colours.

## Usage: (for system wide installation)

 - Vim statusline:

    Add following to your `~/.vimrc` or `/etc/vim/vimrc`:

        set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
        
        " Always show statusline
        set laststatus=2
        
        " Use 256 colours (Use this setting only if your terminal supports 256 colours)
        set t_Co=256

 - Bash prompt:

    Add the following line to your `~/.bashrc` or `/etc/bash.bashrc`:

        if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
            source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
        fi

 - Zsh prompt:

    Add the following line to your `~/.zshrc` or `/etc/zsh/zshrc`:

        if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
            source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
        fi

 - Tmux statusline:

    Add the following line to your `~/.tmux.conf`:

        source /usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf
        set-option -g default-terminal "screen-256color"

    If your terminal supports 256 colours, set `TERM` environment variable to xterm-256color by modifying `~/.bashrc` or `/etc/bash.bashrc` and adding following line:

        export TERM=xterm-256color

    To check if your terminal supports 256 colours check the documentation of your terminal or google it.
    Most popular terminals support 256 colours.


## Configuration:

For detailed information on configuring Powerline: [Configuration](https://powerline.readthedocs.org/en/latest/configuration.html#).


## Uninstall:

To uninstall `Powerline` run one of following commands in terminal:

 - To uninstall per user installation:

        pip uninstall powerline

 - To uninstall system wide installation:

        su -c 'pip uninstall powerline'

Source: [Powerline beta documentation](https://powerline.readthedocs.org/en/latest/index.html)

### Alternatives:

If you're installing Powerline just for Vim you should try vim-airline which is more customizable and lightweight.


---
Source: [www.askubuntu.com](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)


