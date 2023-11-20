# Old alias before ulti-ulti an tea

```.gitconfig
[alias]
    cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d"
	rb = "rebase"
	rb-ulti = "rebase --interactive --autosquash --rebase-merges"
	com = "commit"
	com-ulti = "commit --all --verbose --no-signoff --edit"
	com-ulti-for-linux = "commit --all --verbose --signoff --edit"
	fix-com = "commit --all --fixup"
	cekot = "checkout"
	new-branch = "checkout -b"
	list-branch = "branch -a"
	del = "branch -d" # rey. Mama.
	push-ulti = "push --all"
	push-ulti-and-tags = "!git push --all && git push --tags" # Whatever we can have it
	push-o = "push origin"
	# Normal `pull` Ultimate
	# ----------------------
	pull-ulti = "pull --all --prune"
	# [`hub sync`](https://stackoverflow.com/a/9781639)
	# -------------------------------------------------
	# This updates all local branches that have a matching upstream branch.
	# Need `hub` binary.
	sync = "!hub sync"
	# end of aliases that are not harmful
	del-y = "branch -D" # "Fuck you." - (jealousy) Qabil
	push-force = "push --force-with-lease"
	# end of aliases that **are** harmful
```

> Gak work yang ulti soalnya maybe duplicate nimpa gitu jadi `git com` kan separo dari `git com-ulti`. Fk this. Gak tau ketang.
