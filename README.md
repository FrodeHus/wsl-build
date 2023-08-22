# Ansible playbook for setting up WSL

Up and running quickly: `./bootstrap.sh`

This playbook configures my dotfiles and installs a set of tools I use on a daily basis. It is meant to be used on a fresh install of WSL.

## Git

The playbook will configure the Git client with values defined [here](roles/dev/vars/main.yml) so update those unless you want to commit with my e-mail :)

If a GPG key is detected, Git will also be configured with this key and set `commit.pgpsign` to `true`.

### Keybase & GitHub

If you want to use your Keybase keys to sign GitHub commits, this [Gist](https://gist.github.com/webframp/75c680930b6b2caba9a1be6ec23477c1) got you covered.

TLDR;

```bash
keybase pgp export --secret | gpg --allow-secret-key --import
gpg --list-secret-keys --keyid-format long
gpg --edit-key <key id>
trust
```
