#!/usr/bin/sh

emacs -nw -Q \
      --eval '(setq create-lockfiles nil)' \
      --eval '(setq make-backup-files nil)' \
      --eval '(setq require-final-newline t)' \
      --eval '(setq indent-tabs-mode nil)' \
      --eval '(menu-bar-mode -1)' \
      --eval "(if (eq (frame-terminal-default-bg-mode nil) 'dark) \
                  (load-theme 'modus-vivendi t) \
                (load-theme 'modus-operandi t))" \
      "$@"
