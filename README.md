# setup-mac

For set up mac environment, managed by ansible.

# Prerequisites

- Sign in app store.
- Download gen shin Gothic from browser from [here](https://osdn.jp/downloads/users/8/8637/genshingothic-20150607.zip) .
- Register a public key to github and clone this repo.

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
