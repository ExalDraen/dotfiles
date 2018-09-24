(use-package avy
  :ensure t
  :bind
  (
   ("M-g f" . avy-goto-word-1)
   )
  )

(use-package eldoc
  :ensure t
  )

(use-package helm
  ;; https://writequit.org/eos/eos-helm.html
  :ensure t
  :bind
  ( ;; First using helm for M-x so we get a live filter
    ;; of options, and don't need to keep tab completing.
    ("M-x" . helm-M-x)
    ;; Also use helm for buffers. I can never remember the
    ;; buffers I have open.
    ("C-x C-b" . helm-buffers-list)
    ;; Finding files can also be a pain, so use helm
    ;; to locate and open files
    ("C-x C-f" . helm-find-files)
    ;; Use helm for the kill ring
    ("M-y" . helm-show-kill-ring)
  )
  :config
  (setq helm-boring-buffer-regexp-list (list
                                        ;; (rx "*magit-")
                                        ;; (rx "*magit: ")
                                        ;; (rx "magit-")
                                        ;; (rx "magit: ")
                                        ;; (rx "*helm ")
                                        ;; (rx "*Minibuf-")
                                        ;; (rx "*Echo Area")

                                        ;; (rx "*Backtrace*")
                                        ;; (rx "*code-converting-work*")
                                        ;; (rx "*code-conversion-work*")
                                        ;; (rx "*Compile-Log*")
                                        ;; (rx "*Completions*")
                                        ;; (rx "*groovy*")
                                        ;; (rx "*Help*")
                                        ;; (rx "*Messages*")
                                        (rx "*NeoTree*")
                                        ;; (rx "*scratch*")
                                        ;; (rx "*server*")
                                        ;; (rx "*Shell Command Output*")
                                        )
        )
  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
  )

(use-package helm-swoop
  :ensure t
  :after helm)

;;(use-package hydra
;;  :ensure t)

(use-package multiple-cursors
  :ensure t)


;; https://www.emacswiki.org/emacs/NeoTree
;; | Shortcut  | Action        |
;; | --------- | ------------- |
;; | C-c C-n   | new file      |
;; | C-c C-d   | delete a file |
;; | C-c C-r   | rename        |
;; | C-c C-p   | copy          |

(use-package neotree
  ;; neotree - displays directory tree on the side
  :ensure t
  :config
  (setq neo-show-hidden-files t)
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 35)
  ;; (setq neo-autorefresh t) ;; setting to t will cause neotree to change root after opening a file
  (setq neo-force-change-root t)
  (global-set-key [f7] 'neotree-toggle))
(add-hook 'after-init-hook #'neotree-toggle)

;; full: http://orgmode.org/org.html
;; compact: http://orgmode.org/guide/
;; http://orgmode.org/guide/Tables.html#Tables
(use-package org
  :ensure t)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  (use-package helm-projectile
    :ensure t)
  (helm-projectile-on))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map);; http://projectile.readthedocs.io/en/latest/usage/
;; helm-projectile-switch-project
;; workaround for laggy projectile, more info: https://github.com/bbatsov/projectile/issues/1183
(setq projectile-mode-line
         '(:eval (format " Projectile[%s]"
                        (projectile-project-name))))

(use-package smart-shift
  ;; replaced move-text
  :ensure t
  :config
  (global-smart-shift-mode 1)
  )

(use-package yasnippet
  :ensure t
  :diminish yasnippet-mode
  :config
  (yas-global-mode 1)
  (add-hook 'term-mode-hook (lambda()
          (setq yas-dont-activate t)))
  )

(use-package yasnippet-snippets
  :ensure t)

(provide 'init-tools)
