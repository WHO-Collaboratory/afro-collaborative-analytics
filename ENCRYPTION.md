## Encryption

Most of the incoming data tasks use encryption. This is so that data stored on your machines cannot be read (say, if your laptop is stolen on the tube).  You will need to follow additional instructions to use encrypted data.

### Required packages

First, ensure that you have `cyphr` installed (from CRAN is fine with `install.packages("cyphr")`)

### Requesting access to use the encrypted data

#### Create a keypair

First you need to generate a ssh keypair.  If this command returns FALSE

```
file.exists("~/.ssh/id_rsa")
```

then please run

```
cyphr::ssh_keygen("~/.ssh")
```

you will be prompted to enter a password/passphrase **it is very important that you do this**.  You can pick any password you want, but make it a good one please.

#### Creating the request

From the root of your copy of `afro-collaborative-analytics`, with the repository checked out to `main`, clean, and up-to-date with `origin` (if you are unsure what any of this sentence means contact Lilith, Ed, Ruth, or Charlie), run

```
cyphr::data_request_access()
```

and follow the instructions:  Briefly, create a new branch named `authorise-yourname`, commit the new file in `.cyphr`, and push to github.  Then create a PR and ask someone to add you by posting a message in the `mpox` Teams channel.

Someone will add you by following the instructions below.  Once they have added you, you will need to checkout `main` and pull

```
git checkout main
git pull
```

If you have existing work on another branch that needs the key, merge `main` into it:

```
git checkout yourbranch
git merge main
```

### Authorising someone to use the encrypted data

You will be contacted over Teams, and they will give you a link to a PR.  The PR will contain 1 changed file only, and that will be something like

```
.cyphr/requests/32d7a9c...b1165e96c
```

Check the branch out locally with

```
git checkout authorise-theirname
```

You can then run

```
cyphr::data_admin_authorise()
```

which will print something like

```
There is 1 request for access
```

then prompt you for your private key password, then print instructions for you to follow.

Briefly, commit the changes to the .cyphr directory (removal of the request and addition of a key), and push to github.  Then approve and merge the PR and let the person know that they have access.

