#!zsh


cd /workspaces/DevContainer

# https://www.kenmuse.com/blog/avoiding-dubious-ownership-in-dev-containers/
# https://github.com/microsoft/vscode-remote-release/issues/7923
git config --global --add safe.directory .
git submodule update --init

poetry install