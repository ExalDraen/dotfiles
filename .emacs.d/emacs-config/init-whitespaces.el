(setq-default whitespace-style '(face tabs spaces trailing space-before-tab newline indentation empty space-after-tab tab-mark)) ;; configure which whitespaces to highlight
(global-whitespace-mode t) ;; enable whitespace highglighting global minor mode
(diminish 'global-whitespace-mode) ;; don't display mode name in the status bar
(setq-default show-trailing-whitespace t) ;; highlight trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; delete trailing whitespaces on save

(use-package highlight-indentation
  :ensure t
  :diminish
  )

;; Taken from https://stackoverflow.com/a/4459159/11741678
(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key [(M C i)] 'aj-toggle-fold)


(provide 'init-whitespaces)
