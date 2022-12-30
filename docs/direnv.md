# Installing Direnv

Direnv saves tremendous amount of time. After installing [direnv](https://direnv.net/), add this to your `.zshrc` or equivalent.

```sh
export DIRENV_LOG_FORMAT= # makes direnv less verbose by setting format to nil
eval "$(direnv hook zsh)"
```
