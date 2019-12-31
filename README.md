# Thunix Ansible Playbook

Clone repo, then execute playbook as follows:

```/usr/local/bin/ansible-playbook -i /var/thunix/hosts /var/thunix/site.yml```

## Intro
If you're wondering what this repo is, it's a set of files (YAML files) that are executed by a package known as ["Ansible"](https://en.wikipedia.org/wiki/Ansible_(software)).

Docs for how these files are structured to be used can be found [here](https://docs.ansible.com/).

There are three roles currently being used:  common, webservers, and shell.  Pretty straightfoward, common applies to all machines in the inventory.  webservers applies to the summit box.  shell is for the phoenix box.

So, when you need to add a user, get a package installed, etc etc, please keep the above in mind, and do your changes in the correct role.

* TODO - Maybe rename roles to boxes?  Dunno yet.

## Common tasks

### Adding a user
To add a user to thunix, just copy one of the files in ./roles/shell/tasks/users to a new file in that same directory.  Edit the file, changing the applicable info (user name, keys, homedir, etc etc etc).  Then, add that file's path to ./roles/shells/tasks/users.yml.  Run a syntax check:

```ansible-playbook -i ./hosts site.yml --syntax```

This should just return an "OK" if it looks good (Syntactically).  Doesn't test the logic though!

After that, run it again, without the syntax flag:

```ansible-playbook -i ./hosts site.yml```

If it looks good, add all your files, then push to the repo.

If for whatever reason you **can't** do this, create a PR and let our CI (Drone) test it for you.

### Adding a Package
To install a new package on a machine, just find the package name, and add it to the end of ./role/{which role}/tasks/packages.yml.  Run ansible-playbook against thunix:

```ansible-playbook -i ./hosts site.yml```

## Don't

* Don't commit right to master.  Create a git branch, commit changes there, and do a test run of ansible against it.  Master runs automatically as soon as you push, and we never want master in a broken state.
* Don't be afraid to make a PR!  Worst case, the PR is rejected.  That's fine, nobody will be offended.  What will likely happen is it'll be merged in if it doesn't break master. It might get tweaked a bit, but that's all.
* If you have a problem/request, and don't know how to make it happen, open a ticket.  Even if you know how to fix it, open a ticket, to link to your PR.  It makes a good place to discuss proposed changes.
* ASK!  If you have a question/concern, feel free to ask in IRC.


[Come chat with us! (irc.tilde.chat:6697/#thunix)](https://web.tilde.chat/?join=thunix) ![chat badge](https://tilde.chat/badges/badge.php?channel=%23thunix)
