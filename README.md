# nvim-simple

## Ubuntu prerequisites
sudo apt update
sudo apt install -y ripgrep fd-find shellcheck jq
python3 -m pip install --user pynvim stylua

## Node-based tools
npm i -g markdownlint-cli @fsouza/prettierd prettier
echo 'export PATH="$HOME/.npm-packages/bin:$PATH"' >> ~/.zshrc

## First sync
NVIM_APPNAME=nvim-simple nvim --headless "+Lazy! sync" +qa
