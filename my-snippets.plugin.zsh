# # Define the expansion function for ~hello
# expand-hello() {
#   local buffer="$BUFFER"
#   if [[ $buffer =~ '~hello$' ]]; then
#     BUFFER="hello have a nice day"
#     CURSOR=6  # Move the cursor to the position after 'hello '
#   fi
# }

# # Define the expansion function for ~goodbye
# expand-goodbye() {
#   local buffer="$BUFFER"
#   if [[ $buffer =~ '~goodbye$' ]]; then
#     BUFFER="goodbye have a great day"
#     CURSOR=8  # Move the cursor to the position after 'goodbye '
#   fi
# }

# # Create a wrapper function that calls both functions
# expand-snippets() {
#   expand-hello
#   expand-goodbye
# }

# # Bind the wrapper function to a key combination, e.g., Ctrl+H
# zle -N expand-snippets
# bindkey '^H' expand-snippets  # Change this to your preferred key combination


# Snippets

# Expand with Random Five Digits Logic
expand-mp4() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~mp4$' ]]; then
    # Seed the RANDOM variable with the current time
    RANDOM=$(( $(date +%s) % 32768 ))
    # Generate a random 5-digit number
    randomNumber=$(printf "%05d" $((RANDOM % 100000)))
    # Modify the BUFFER to include the random number
    BUFFER="i= ; ffpb -i \$i -c:v libx264 -pix_fmt yuv420p -c:a aac \"\${i%.*}_${randomNumber}.mp4\""
    CURSOR=2  # Move the cursor to the position
  fi
}


# Change Video Dimentions Using Divide
expand-ffpb-Divide() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~ffpb/$' ]]; then
    # Seed the RANDOM variable with the current time
    RANDOM=$(( $(date +%s) % 32768 ))
    # Generate a random 5-digit number
    randomNumber=$(printf "%05d" $((RANDOM % 100000)))
    # Modify the BUFFER to include the random number
    BUFFER="i= ; ffpb -i \$i -vf scale=iw/2:ih/2 \"\${i%.*}_${randomNumber}.mp4\""
    CURSOR=2  # Move the cursor to the position
  fi
}


expand-m4a() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~m4a$' ]]; then
    # Seed the RANDOM variable with the current time
    RANDOM=$(( $(date +%s) % 32768 ))
    # Generate a random 5-digit number
    randomNumber=$(printf "%05d" $((RANDOM % 100000)))
    # Modify the BUFFER to include the random number
    BUFFER="i= ; ffpb -i \$i \"\${i%.*}_${randomNumber}.m4a\""
    CURSOR=2  # Move the cursor to the position
  fi
}

# Merge Movie with Subtitle
expand-sub() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~sub$' ]]; then
    # Seed the RANDOM variable with the current time
    RANDOM=$(( $(date +%s) % 32768 ))
    # Generate a random 5-digit number
    randomNumber=$(printf "%05d" $((RANDOM % 100000)))
    # Modify the BUFFER to include the random number
    BUFFER="i= ; ffpb -i \$i -vf \"subtitles=subtitle.srt:force_style='FontName=GE Aridi Naskh,FontSize=20'\" \"\${i%.*}_${randomNumber}.mp4\""
    CURSOR=2  # Move the cursor to the position
  fi
}


expand-levels() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~levels$' ]]; then
    # Seed the RANDOM variable with the current time
    RANDOM=$(( $(date +%s) % 32768 ))
    # Generate a random 5-digit number
    randomNumber=$(printf "%05d" $((RANDOM % 100000)))

    # Modify the BUFFER to include the random number before the extension in the last ${i}
    BUFFER="i= ; ffpb -i \$i -filter:a \"volume=5dB\" \${i%.*}_${randomNumber}.\${i##*.}"
    CURSOR=2  # Move the cursor to the position
  fi
}


# Get Media Info Using ffprobe
expand-ffprobe() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~ffprobe$' ]]; then

    # Modify the BUFFER to include the random number before the extension in the last ${i}
    BUFFER="i=  ; ffprobe -v error -i \$i -print_format json -show_streams -show_format | jq '.streams[] | if .codec_type == \"video\" then {width, height, codec_name, codec_long_name, r_frame_rate} elif .codec_type == \"audio\" then {codec_name, codec_long_name, sample_rate} else empty end'"
    CURSOR=2  # Move the cursor to the position
  fi
}


# PDF to PNG Using Ghostscript
pdf-to-png() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~pdftopng$' ]]; then
    BUFFER="i= ; gs -dNOPAUSE -dBATCH -sDEVICE=ppm -r300  -sOutputFile=\${i%.*}-000%d.png \$i"
    CURSOR=2  # Move the cursor to the position
  fi
}


# Delete All Files with a Specific Extension in the Working Directory Recursively (Including Sub-Directories)
expand-del() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~del$' ]]; then
    BUFFER="find . -type f -name \"*.\" -delete"
    CURSOR=24  # Move the cursor to the position
  fi
}

# Print the Total Size of a Specific Extension in the Current Directory Recursively (Including Sub-Directories)
expand-total-size() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~totals$' ]]; then
    BUFFER="find . -type f -name \"*.\" -exec du -ch {} + | grep total\$"
    CURSOR=24  # Move the cursor to the position
  fi
}



# Tree Command Snippet, Add More Extensions with a Pipe | 
expand-tree() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~tree$' ]]; then
    BUFFER="tree -P \"*.\" --prune -L 1"
    CURSOR=11  # Move the cursor to the position
  fi
}


# AtomicParsley
atomic-parsley() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~atom$' ]]; then
    BUFFER="AtomicParsley  --artwork artwork"
    CURSOR=14  # Move the cursor to the position
  fi
}

# Count How Many File with a Specific Extension in a Main Directory Recursively
expand-count() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~count$' ]]; then
    BUFFER="find \"\$(pwd)\" -type f -name \"*.\" | wc -l"
    CURSOR=31  # Move the cursor to the position
  fi
}

# Source ZSHRC File with a Snippet
expand-source() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~so$' ]]; then
    BUFFER="source ~/.zshrc"
    CURSOR=15  # Move the cursor to the position
  fi
}

# Open ZSHRC File with VS-Code
expand-code-zsh() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~co-z$' ]]; then
    BUFFER="code ~/.zshrc"
    CURSOR=13  # Move the cursor to the position
  fi
}

# Open ZSH Snippet File with VS-Code
expand-zsh-snippets() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~co-s$' ]]; then
    BUFFER="code ~/my-snippets.plugin.zsh"
    CURSOR=29  # Move the cursor to the position
  fi
}

# Convert a Video File to Png Sequence
expand-frames() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~frames$' ]]; then
    BUFFER="i=  ; ffpb -i \$i frame-%04d.png"
    CURSOR=2  # Move the cursor to the position
  fi
}

# Upload Files to File.io Using Curl and Tee
expand-upload() {
  local buffer="$BUFFER"
  if [[ $buffer =~ '~upload$' ]]; then
    BUFFER="i=  ; curl --progress-bar --no-buffer -F \"file=@\$i\" https://file.io | tee >(jq)"
    CURSOR=2  # Move the cursor to the position
  fi
}



# Create a wrapper function that calls all functions
expand-snippets() {
  expand-mp4
  expand-m4a
  expand-levels
  pdf-to-png
  atomic-parsley
  expand-ffprobe
  expand-tree
  expand-count
  expand-source
  expand-code-zsh
  expand-zsh-snippets
  expand-frames
  expand-ffpb-Divide
  expand-upload
  expand-del
  expand-total-size
  expand-sub
}
# Note: The Functions Naming Must Be Not the Same as a Command


# Bind the wrapper function to a key combination, e.g., Ctrl+H
zle -N expand-snippets
# bindkey '^H' expand-snippets  # Change this to your preferred key combination
bindkey '`' expand-snippets  # we are using backtick (the telda key)
