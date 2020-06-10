## SSH key
1. Generate new SSH key

`$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

2. Start the ssh-agent in the background

`$ eval "$(ssh-agent -s)"`

3. Modify your ~/.ssh/config file to automatically load keys into the ssh-agent and store passphrases in your keychain
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```
4. Add your SSH private key to the ssh-agent and store your passphrase in the keychain

`$ ssh-add -K ~/.ssh/id_rsa`

5. Copy to add to Git provider accounts

`$ pbcopy < ~/.ssh/id_rsa.pub`

## Installation
```
curl -fsSLO https://raw.githubusercontent.com/sanderginn/dotfiles/master/pre.sh \
  && chmod +x pre.sh \
  && ./pre.sh
```

## Possible problems
* `$ Error: Permission denied @ dir_s_mkdir - /usr/local/Caskroom`
Set correct permissions with `sudo chown <username>:staff /usr/local/Caskroom`

