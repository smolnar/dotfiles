# Create a new directory and enter it
function mkd
  mkdir -p "$argv"; and cd "$argv[1]"
end

# Change working directory to the top-most Finder window location
function cdf
  cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
end

# Syntax-highlight JSON strings or files
# Usage: `echo '{"foo":42}' | json`
function json
  python -mjson.tool | pygmentize -l javascript
end
