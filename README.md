# Scripts
Some helpful scripts to ease life. To get things set up (assuming that you cloned this in `~/scripts`):

### Git
Edit your `~.gitconfig` to look like:
```
[user]
        email = <your_email>
        name = <your_name>
[include]
        path = ~/scripts/gitconfig
```

### Bash
To use the provided `inputrc` as the local one create a symlink to it:
```
$ ln -s scripts/bash/inputrc ~/.inputrc
```
