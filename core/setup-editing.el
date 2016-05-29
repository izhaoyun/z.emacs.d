(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))) 

(setq visible-bell t
      inhibit-startup-message t
      sentence-end-double-space nil)

(global-hl-line-mode 1)
(global-font-lock-mode 1)
(global-linum-mode 1)
(column-number-mode 1)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(use-package paren
  :config
  (setq show-paren-style 'expression)
  (show-paren-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package elec-pair
  :ensure nil
  :init
  (setq electric-pair-pairs '((?\" . ?\")
			      (?\{ . ?\})))
  (electric-pair-mode 1))

(use-package expand-region
  :bind
  (("C-=" . er/expand-region)
   ("C--" . er/contract-region)))

(use-package undo-tree
  :diminish undo-tree-mode
  :commands global-undo-tree-mode
  :bind
  ("C-z" . undo)
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode))

(use-package whitespace
  :commands whitespace-mode
  :config
  (add-hook 'prog-mode-hook #'whitespace-mode))

(use-package winner
  :commands winner-mode
  :init
  (winner-mode))

(use-package comment-dwim-2
  :bind
  ("M-;" . comment-dwim-2))

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :config
  (global-aggressive-indent-mode 1))

(use-package clean-aindent-mode
  :init
  (electric-indent-mode -1)
  (clean-aindent-mode 1)
  (setq clean-aindent-is-simple-indent t))

(use-package indent-guide
  :diminish indent-guide-mode
  :init
  (indent-guide-mode 1))

(use-package abbrev
  :ensure nil
  :diminish abbrev-mode
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))

;; (use-package edit-server
;;   :if window-system
;;   :init
;;   (add-hook 'after-init-hook 'server-start t)
;;   (add-hook 'after-init-hook 'edit-server-start t))

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "RET") 'newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'setup-editing)