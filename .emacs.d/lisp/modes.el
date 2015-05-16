;; Python
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.python$" . python-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; RUST
(autoload 'rust-mode "rust-mode" "Rust editing mode." t)
(setq auto-mode-alist (cons '("\.rs$" . rust-mode) auto-mode-alist))

;; LUA
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))

;; PHP
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[0-9]?$" . php-mode)) auto-mode-alist))

;; MarkDown
(autoload 'markdown-mode "markdown-mode.el" "Markdown mode." t)
(setq auto-mode-alist (cons '("\.markdown$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.mdwn$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.mdt$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.md$" . markdown-mode) auto-mode-alist))

;; JSON
(setq auto-mode-alist (cons '("\.json$" . js-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.geojson$" . js-mode) auto-mode-alist))

;; HTML
(setq auto-mode-alist (cons '("\.template$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.tpl$" . html-mode) auto-mode-alist))
