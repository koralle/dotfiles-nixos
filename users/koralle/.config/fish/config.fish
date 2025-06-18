# Initialize Starship
# https://starship.rs/ja-JP/guide/
starship init fish | source

# Initialize mise
# https://mise.jdx.dev/getting-started.html#_2a-activate-mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Initialize zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

