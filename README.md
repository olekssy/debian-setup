# debian-setup
Debian post-install setup script

https://github.com/lialkaas/debian-setup

* runs _remote_ post-install setup

https://gitlab.com/defcronyke/debian-post-install

* runs _custom_ post-install setup
* installs VScode.
* installs oh-my-zsh
* sets `vimrc` and `zshrc`

## Run

The url gets the main script from the repo.

```shell
su - -c 'apt update && apt install -y wget' && \
bash <(wget -qO - https://bit.ly/3Om4LkL)
```

