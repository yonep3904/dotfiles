# Neovim Setup

## Dependencies

- `neovim`

- `git`
- `curl`
- `build-essential`

- `ripgrep`
- `fd-find`

- `pynvim`
- `lua-language-server`

Install:

```sh
# Install (Ubuntu)
sudo apt update
sudo apt install -y neovim git curl build-essential ripgrep fd-find

# Python
uv tool install pynvim # Use uv

# Lua
cd /tmp
mkdir lua-language-server
curl -LO https://github.com/LuaLS/lua-language-server/releases/latest/download/lua-language-server-3.18.2-linux-x64.tar.gz
tar -xzf lua-language-server-3.18.2-linux-x64.tar.gz -C lua-language-server

sudo mv lua-language-server /opt/lua-language-server

sudo tee /usr/local/bin/lua-language-server > /dev/null <<'EOF'
#!/bin/bash
exec /opt/lua-language-server/bin/lua-language-server "$@"
EOF # Use tee to create the wrapper script
sudo chmod +x /usr/local/bin/lua-language-server
```

wrapper script for `lua-language-server`:
```sh
#!/bin/bash
exec /opt/lua-language-server/bin/lua-language-server "$@"
```

## Set symbolic link for `nvim`:

```sh
ln -s [path to this directory] ~/.config/nvim
```
