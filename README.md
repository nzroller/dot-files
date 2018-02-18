## Quick Start
```sh
sudo ./bootstrap
make
```

## Install actual dotfiles
```sh
find . -mindepth 1 -maxdepth 1 -not \( -path "./.git" -o -path "./playbooks" \) -prune -type d -printf '%P\n'  | xargs -I {} stow {}

## Other things (docker role should do this actually...)

  ```sh
  sudo adduser tim docker
  ```

## When opening Eclipse & Intellij for the first time they'll want to configure some things
