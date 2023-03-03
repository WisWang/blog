
cat .zshrc|egrep -v "#|^$"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git kubectl)
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k
source <(helm completion zsh)
export PATH=~/.kubectx:$PATH
export PATH=~/.krew/bin:$PATH
autoload -Uz compinit
compinit
alias test-k8s="export KUBECONFIG=~/.kube/test-k8s && cluster=test-k8s"
test-k8s


export ZSH_THEME=alanpeabody
vim ~/.oh-my-zsh/themes/alanpeabody.zsh-theme

local k8s_info='%{$fg[yellow]%}$cluster:%{$fg[red]%}$(grep namespace $KUBECONFIG|cut -d":" -f 2)'
PROMPT="${user} ${k8s_info} ${pwd}$ "

### zsh auto complete

git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s ~/.kubectx/completion/_kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s ~/.kubectx/completion/_kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

