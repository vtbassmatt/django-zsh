# django-zsh plugin

This plugin provides completion for Django `manage.py` / `django-admin.py`.

To use it, clone the repo in your plugins folder and add `django` to the plugins array in your zshrc file:

```shellsession
% cd "${ZSH}/custom/plugins"
% git clone https://github.com/vtbassmatt/django-zsh django
```

(If you don't add the trailing "django", then the plugin will be called "django-zsh" below.)

```zsh
# in .zshrc
plugins=(... django)
```
