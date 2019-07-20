[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}


# fpush - checkout git branch/tag
fpsh() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git push origin $(echo "$target" | awk '{print $2}')
}

# fpull - checkout git branch/tag
fpull() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git pull origin $(echo "$target" | awk '{print $2}')
}

iosChromeDebug() {
  ios_webkit_debug_proxy -f chrome-devtools://devtools/bundled/inspector.html
}

kbdd() {
  npm run deploy -- --env dev
}

kbdp() {
  npm run deploy -- --env prod
}

fdw() {
  local dir
  dir=$(fd -E node_modules -E src -E open-source -t d -a ".*" ~/Documents/work 2> /dev/null | fzf +m) &&
  cd $dir
}

fdo() {
  local dir
  dir=$(fd -E node_modules -E src -E open-source -t d -a ".*" ~/Documents/others 2> /dev/null | fzf +m) &&
  cd $dir
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export ANDROID_HOME=/path/to/android-sdk
