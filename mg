#!/usr/bin/sh

emacs -nw -Q \
      --eval '(menu-bar-mode -1)' \
      --eval '(setq create-lockfiles nil
                    make-backup-files nil
                    require-final-newline t
                    indent-tabs-mode nil)' \
      --eval "(if (eq (frame-terminal-default-bg-mode nil) 'dark)
                  (load-theme 'modus-vivendi t)
                (load-theme 'modus-operandi t))" \
      "$@"
