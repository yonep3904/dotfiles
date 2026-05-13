# GitHub SSH Configuration

## 1. Generate SSH key pair

```sh
mkdir -p ~/.ssh

ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub
```

## 2. Add the public key to GitHub

1. Go to GitHub > Settings > SSH and GPG keys (https://github.com/settings/keys)
2. Click "New SSH key"
3. Paste the public key and save

## 3. Test the connection

```sh
ssh -T git@github.com

# Hi (account name)! You've successfully authenticated, but GitHub does not provide shell access.
```
