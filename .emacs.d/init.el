;;; init.el --- -*- lexical-binding: t; -*-

;; examples
;; https://github.com/purcell/emacs.d/blob/master/init.el
;; http://pages.sachachua.com/.emacs.d/Sacha.html
;; https://www.emacswiki.org/emacs/emacs-init.el
;; https://www.cs.utah.edu/~aek/code/init.el.html
;; https://gist.github.com/atilaneves/f78918db2de53f2cf45d

(setq debug-on-error t)
(setq inhibit-default-init t) ;; don't load default.el init file https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
(add-to-list 'load-path (expand-file-name "emacs-config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))
(package-initialize)
(require 'init-package-repos)

;; emacs config
(require 'init-autocomplete)
(require 'init-backup-autosave)
(require 'init-clipboard)
(require 'init-custom-functions)
(require 'init-evil)
(require 'init-magit)
(require 'init-mouse-scrolling)
(require 'init-other)
(require 'init-parens)
(require 'init-spell-check)
(require 'init-tabs-spaces)
(require 'init-tools)
(require 'init-view-preferences)
(require 'init-whitespaces)

;; lang
;;(require 'init-ansible)
;;(require 'init-bibtex)
;;(require 'init-clojure)
(require 'init-docker)
;;(require 'init-erlang)
(require 'init-eruby)
;;(require 'init-gnuplot)
(require 'init-golang)
(require 'init-groovy)
;;(require 'init-haskell)
(require 'init-html)
;;(require 'init-jinja2)
(require 'init-json)
(require 'init-lisp)
(require 'init-markdown)
(require 'init-nix)
;;(require 'init-php)
(require 'init-puppet)
(require 'init-python)
(require 'init-rpm)
(require 'init-rust)
;;(require 'init-scala)
(require 'init-shell)
(require 'init-terraform)
;;(require 'to-be-processed)
(require 'init-toml)
(require 'init-xml)
(require 'init-yaml)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-tags-on-save t)
 '(helm-ff-lynx-style-map t)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (a yaml-mode toml-mode company-terraform rpm-spec-mode virtualenvwrapper elpy puppet-mode nix-buffer nix-sandbox markdown-toc json-mode jinja2-mode htmlize go-eldoc go-complete go-stacktracer go-autocomplete gnuplot dockerfile-mode fill-column-indicator powerline monokai-theme smart-shift org-trello helm-swoop evil auto-complete diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eruby-standard-face ((t (:background "dark slate gray")))))
