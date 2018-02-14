(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "M-g f") 'avy-goto-word-1))

(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))
(defadvice auto-complete-mode (around disable-auto-complete-for-python)
  (unless (eq major-mode 'python-mode) ad-do-it))
(ad-activate 'auto-complete-mode)

(use-package helm
  ;; HELM - fuzzy matching, etc.
  :ensure t
  :bind ( ;; First using helm for M-x so we get a live filter
          ;; of options, and don't need to keep tab completing.
          ("M-x" . helm-M-x)
          ;; Also use helm for buffers. I can never remember the
          ;; buffers I have open.
          ("C-x C-b" . helm-buffers-list)
          ;; Finding files can also be a pain, so use helm
          ;; to locate and open files
          ("C-x C-f" . helm-find-files)))

(use-package helm-swoop
  :ensure t
  :after helm)

(use-package hydra
  :ensure t)

(use-package magit
  :ensure t)
(global-set-key (kbd "C-x g") 'magit-status)

(use-package org
  :ensure t)

(use-package org-trello
  :ensure t
  :config
  (setq org-trello-files '("/home/michal/trello")))

(use-package multiple-cursors
  :ensure t)

(use-package neotree
  ;; neotree - displays directory tree on the side
  :ensure t
  :config
  (setq neo-show-hidden-files t)
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 35)
  (global-set-key [f8] 'neotree-toggle))
(add-hook 'after-init-hook #'neotree-toggle)
(defun workspace ()
  (interactive)
  (neotree-dir "/media/veracrypt1/1_home/weekly.0/localhost/1_home/workspace"))
(defun workworkspace ()
  (interactive)
  (neotree-dir "/home/michal/workspace"))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  (use-package helm-projectile
    :ensure t)
  (helm-projectile-on))
;; helm-projectile-switch-project
;; rofi

(use-package smart-shift
  ;; replaced move-text
  :ensure t
  :config
  (global-smart-shift-mode 1))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config)
  ;; (smartparens-global-mode t))

(setq show-paren-delay 0)  ;; disable delay when highlighting matching parenthesis
(show-paren-mode 1)  ;; highlight matching parenthesis

(use-package tabbar
  :ensure t)
(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
  "Returns the name of the tab group names the current buffer belongs to.
  There are two groups: Emacs buffers (those whose name starts with '*', plus
  dired buffers), and the rest.  This works at least with Emacs v24.2 using
  tabbar.el v1.7."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
       ((eq major-mode 'dired-mode) "emacs")
       (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
(tabbar-mode 1)

(use-package yasnippet
  :ensure t
  :diminish yasnippet-mode
  :config
  (yas-global-mode 1))
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))



(provide 'init-tools)