# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install and configure Git
brew install git
git config --global user.name "Sander Ginn"
git config --global user.email "sander@ginn.it"

# Clone dotfiles repo
mkdir -p ~/repos/github/sanderginn
cd ~/repos/github/sanderginn
git clone https://github.com/sanderginn/dotfiles
cd dotfiles

# Configure Dotbot
git init # initialize repository if needed
git submodule add https://github.com/anishathalye/dotbot
git config -f .gitmodules submodule.dotbot.ignore dirty # ignore dirty commits in the submodule
cp dotbot/tools/git-submodule/install .
touch install.conf.yaml
