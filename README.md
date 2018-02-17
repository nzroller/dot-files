Quick Start
```sh
sudo ./bootstrap
make
```

Install actual dotfiles
```sh
find . -mindepth 1 -maxdepth 1 -not \( -path "./.git" -o -path "./playbooks" \) -prune -type d -printf '%P\n'  | xargs -I {} stow {}

# Other things
```sh
sudo adduser tim docker
```
