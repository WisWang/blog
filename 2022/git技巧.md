


brew install hub



### gitconfig

```
 cat ~/.gitconfig
[filter "lfs"]
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
[init]
	defaultBranch = main
[user]
	name = Wis Wang
	email = wis@qq.com
[core]
	pager = cat
[pull]
	rebase = false

[hub]
  protocol = https
  host = github.com
[includeIf "gitdir:~/Desktop/GitHub/"]
  path = ~/Desktop/GitHub/.gitconfig
[alias]
  # lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
  lg = log --graph --pretty=format:'%C(yellow)%d%Creset %C(cyan)%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all
  prlist = pr list -L 100 --format='%t [%H] | %U%n'
  prclose = issue update --state closed
```

### exportPath

```
 tree scripts/exportPath
scripts/exportPath
├── cleanInactiveBranches
├── fetchMain
├── fetchMaster
├── gitfork
└── pr2git
```



### ~/.zshrc

```
alias ww="tail -1 ~/myown.txt"
alias hgit="git add . && git commit -am wis-$(date +%Y%m%d)"
alias wgit="git pull && git add * && git commit -am wis-$(date +%Y%m%d) && git push"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
autoload -U compinit && compinit

alias k8sprompt="source ~/.kube/prompt.sh"
#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1
export PATH="/usr/local/opt/openjdk/bin:$PATH"

alias git=hub
alias gitm="git add . && git commit -m"
export PATH="/Users/user/Vscode/scripts/exportPath:$PATH"
alias gitfork=". gitfork"
alias gitfix='gitm "fix" && git push'
```
