#!/usr/bin/env fish

# This shell Script is not for Interactive Shell.
if not shell is-interactive
    return 0
end
# Check if there's no fisher.
if not type -q fisher
    printf "There's no Fisher Plugin.\nInstalling..."
    xh https://git.io/fisher | source
end

set -l plugins \
    jorgebucaran/fisher \
    jethrokuan/z \
    PatrickF1/fzf.fish \
    joseluisq/gitnow \
    jorgebucaran/autopair.fish \
    nickeb96/puffer-fish \
    acomagu/fish-async-prompt \
    franciscolourenco/done \
    meaningful-ooo/sponge \

for plugin in $plugins
    if fisher list | rg -q "^$p\$"
        fisher update $plugin
    else
        fisher install $plugin
    end
end
