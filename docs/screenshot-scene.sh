# Scene for the extension gallery screenshot; see the rozi-extension skill's screenshots guide.
# Neovim with two splits beside a rozi pane: `Ctrl+H/J/K/L` crosses both kinds of border alike.
project="$HOME/src/vim-rozi-navigator"
mkdir -p "$project" "$XDG_CONFIG_HOME/nvim"
cp -R "$EXTENSION/plugin" "$EXTENSION/doc" "$EXTENSION/README.md" "$project/"
git init -q -b main "$project"
git -C "$project" add -A
git -C "$project" -c user.name=demo -c user.email=demo@example.invalid commit -q -m init
printf '\n" Wrap at the edge of the screen.\n' >> "$project/plugin/rozi_navigator.vim"
cat > "$XDG_CONFIG_HOME/nvim/init.lua" <<LUA
vim.opt.runtimepath:append("$EXTENSION")
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.opt.swapfile = false
vim.opt.wrap = false
LUA

keys "cd ~/src/vim-rozi-navigator" Enter
# Right column: the keys the extension suggests, above a shell.
right=$(rozi split --cwd "$project" --argv bash -c \
    "rozi extensions list --verbose | sed -n '/navigation targets/,\$p'; exec bash" |
    python3 -c "import json, sys; print(json.load(sys.stdin)['data']['id'])")
settle 300
rozi focus "$right" >/dev/null
rozi split --cwd "$project" --argv bash -c "git status --short --branch; exec bash" >/dev/null
settle 300
rozi focus 1 >/dev/null
settle 300
keys "clear; nvim plugin/rozi_navigator.vim -c 'vsplit README.md' -c 'wincmd l'" Enter
settle 2500
