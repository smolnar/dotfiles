# Update
brew update

# Upgrade
brew upgrade

# Versions
brew tap homebrew/versions

# Shells & Unix
brew install zsh fish bash tmux reattach-to-user-namespace grc findutils moreutils gnupg
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# Vim & Tools
brew install vim --override-system-vi --disable-nls
brew install ack
brew install htop

# Git
brew install git

# Databases
brew install postgresql sqlite3 elasticsearch17 redis

# Install lunchy
gem install lunchy

brew cleanup
