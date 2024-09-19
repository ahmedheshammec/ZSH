# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autopair
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Activate Code Command in ZSH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Activate Pycharm Command in ZSH
export PATH="$PATH:/Applications/PyCharm.app/Contents/MacOS/"

#Aliases
alias md='mkdir'
alias yt-dlp="/usr/local/bin/yt-dlp_macos"



# Activate `myscripts` Environmental Variable
export PATH="$PATH:/Users/Ahmed/Documents/myscripts"


# Adding Typora App
typora() {
    local file_path="$1"
    local template_path=/Users/Ahmed/Documents/Templates/basic_template.md

    # Check if a file path was provided
    if [ -z "$file_path" ]; then
        echo "Please provide a file path."
        return 1
    fi
    
    # Ensure the file has a .md extension
    if [[ "$file_path" != *.md ]]; then
        file_path="${file_path}.md"
    fi
    
    if [ ! -d "$file_path" ]; then
        cp -R "$template_path" "$file_path"
    fi
    
    open -a "Typora" "$file_path"
}


# Adding Final Cut Pro
fcp() {
    local file_path="$1"
    local template_path="/Users/Ahmed/Movies/Untitled.fcpbundle"
    
    # Check if a file path was provided
    if [ -z "$file_path" ]; then
        echo "Please provide a file path."
        return 1
    fi
    
    # Ensure the file has a .fcpbundle extension
    if [[ "$file_path" != *.fcpbundle ]]; then
        file_path="${file_path}.fcpbundle"
    fi
    
    # Check if the directory doesn't exist, then copy the template
    if [ ! -d "$file_path" ]; then
        cp -R "$template_path" "$file_path"
    else
        echo "Project already exists. Opening existing project."
    fi
    
    # Open the project with Final Cut Pro
    open -a "/Volumes/Samsung T5/Apps Installed (To Free Space)/Final Cut Pro.app" "$file_path"
}



# Adding Premiere Pro App
premiere() {
    local file_path="$1"
    local template_path=/Users/Ahmed/Documents/Templates/basic_template.prproj

    # Check if a file path was provided
    if [ -z "$file_path" ]; then
        echo "Please provide a file path."
        return 1
    fi
    
    # Ensure the file has a .prproj extension
    if [[ "$file_path" != *.prproj ]]; then
        file_path="${file_path}.prproj"
    fi
    
    if [ ! -f "$file_path" ]; then
        cp "$template_path" "$file_path"
    fi
    
    open -a "/Volumes/Samsung T5/Apps Installed (To Free Space)/Adobe Premiere Pro 2024/Adobe Premiere Pro 2024.app" "$file_path"
}


# Adding After Effects
aep() {
    local file_path="$1"
    local template_path=/Users/Ahmed/Documents/Templates/basic_template.aep

    # Check if a file path was provided
    if [ -z "$file_path" ]; then
        echo "Please provide a file path."
        return 1
    fi
    
    # Ensure the file has a .aep extension
    if [[ "$file_path" != *.aep ]]; then
        file_path="${file_path}.aep"
    fi
    
    if [ ! -d "$file_path" ]; then
        cp -R "$template_path" "$file_path"
    fi
    
    open -a "/Volumes/Samsung T5/Apps Installed (To Free Space)/Adobe After Effects 2024/Adobe After Effects 2024.app" "$file_path"
}




# Pyenv
export PATH="$PATH:/opt/homebrew/Cellar/pyenv/2.4.12/bin/"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# Kill Whole Line 
bindkey '^X' kill-whole-line






# source custom snippets
source /Users/Ahmed/my-snippets.plugin.zsh







