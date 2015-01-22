# Symphony

How I provision a nix based system for myself quickly.

## Quick start

To get started quickly glone and run the bootstrap.

    git clone git@github.com:kennedyj/symphony.git $HOME/.symphony

    bash $HOME/.symphony/bootstrap/start.sh

## Install vimrc for a server

This command will download a simplified vimrc without all the extra plugins.

```sh
curl -s 'https://raw.githubusercontent.com/kennedyj/symphony/master/vim/configs/server.vimrc' > ~/.vimrc
```
