(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "~/.emacs.d")

(load "modes.el")
(load "std_comment.el")

(setq column-number-mode t)
(setq x-alt-keysym 'meta)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
