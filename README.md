# setup-mac

For set up mac environment, managed by ansible.

# Prerequisites

- sign in app store.
- get gen shin Gothic from browser.
- register a public key to github and clone this repo.

```sh
$ ssh-keygen -t ed25519 -C "708.u.biz@gmail.com"
$ git clone git@github.com:708u/setup-mac.git
```

## Set Up

```sh
$ make init
$ make deploy
```

Need to reboot after setup.
