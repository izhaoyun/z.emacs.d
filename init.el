(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))
(setq load-prefer-newer t)

(defun install-pkgs (pkgs-list)
  "Install all require packages."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package pkgs-list)
    (unless (package-installed-p package)
      (package-install package)))
  )

;; (setq sentence-end-double-space nil)
;; (setq truncate-partial-width-windows nil)
;; (setq-default indicate-empty-lines t)
;; (setq require-final-newline t)

;; (use-package elec-pair
;;   :ensure nil
;;   :init
;;   (setq electric-pair-pairs '((?\" . ?\")
;;                               (?\{ . ?\})))
;;   (electric-pair-mode 1))

;; (use-package paren
;;   :ensure nil
;;   :init
;;   (setq show-paren-style 'expression)
;;   (show-paren-mode 1))

;; (use-package rainbow-delimiters
;;   :defer 5
;;   :config
;;   (rainbow-delimiters-mode))

;; (setq read-buffer-completion-ignore-case t)

;; (global-unset-key "\C-x\C-v")
;; (global-set-key (kbd "M-/") 'hippie-expand)

;; ;; buffers and windows
;; (setq frame-title-format "%b - emacs")

;; (use-package peep-dired
;;   :defer 9
;;   :commands peep-dired
;;   :bind
;;   (:map dired-mode-map
;;         ("P" . peep-dired)
;;         ("n" . peep-dired-next-file)
;;         ("p" . peep-dired-prev-file)
;;         ("K" . peep-dired-kill-buffers-without-window)
;;         ("C-n" . dired-next-line)
;;         ("C-p" . dired-previous-line))
;;   :init
;;   (setq peep-dired-enable-on-directories t))

;; (use-package ibuffer
;;   :bind
;;   ("C-x C-b" . ibuffer)
;;   :init
;;   (defun ibuffer-group-buffers ()
;;     (ibuffer-switch-to-saved-filter-groups "Default"))
;;   (add-hook 'ibuffer-mode-hook #'ibuffer-group-buffers)
;;   (add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)
;;   (setq ibuffer-saved-filter-groups
;;         '(("Default"
;;            ("Dired" (mode . dired-mode))
;;            ("ERC"   (mode . erc-mode))
;;            ("Magit" (name . "\*magit.+*"))
;;            ("Org"   (mode . org-mode))
;;            ("Grep"  (name . "\*grep-.*"))
;;            ("Temporary" (name . "\*.*\*"))))))

;; (setq backup-directory-alist '(("-autoloads.el\\'")
;;                                ("-loaddefs.el\\'")
;;                                ("." . "~/.emacs.d/backups")))

;; (setq delete-old-versions -1)
;; (setq version-control t)
;; (setq auto-save-file-name-transforms
;;       '((".*" "~/.emacs.d/auto-save-list/" t)))

;; (use-package savehist
;;   :init
;;   (savehist-mode 1)
;;   (setq savehist-file "~/.emacs.d/savehist")
;;   (setq savehist-additional-variables
;;         '(kill-ring search-ring regexp-search-ring)))

;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (defalias 'yes-or-no-p 'y-or-n-p)
;; (setq gc-cons-threshold 104857600)

;; (use-package server
;;   :defer 10
;;   :config
;;   (unless (server-running-p)
;;     (server-start)))

;; (use-package winner
;;   :defer 8
;;   :config
;;   (winner-mode))

;; (use-package window-numbering
;;   :defer 10
;;   :config
;;   (window-numbering-mode))

;; ;; editing
;; (use-package annotate
;;   :commands annotate-mode
;;   :init
;;   (setq annotate-file "~/.emacs.d/annotations"))

;; (use-package expand-region
;;   :bind
;;   (("C-=" . er/expand-region)
;;    ("C--" . er/contract-region)))

;; (use-package change-inner
;;   :bind
;;   (("M-i" . change-inner)
;;    ("M-o" . change-outer)))

;; (use-package undo-tree
;;   :diminish undo-tree-mode
;;   :bind
;;   ("C-z" . undo)
;;   :init
;;   (setq undo-tree-visualizer-diff t)
;;   (setq undo-tree-visualizer-timestamps t)
;;   (global-undo-tree-mode))

;; ;; (use-package recentf
;; ;;   :commands recentf-mode
;; ;;   :init
;; ;;   (recentf-mode 1))

;; (add-hook 'before-save-hook #'delete-trailing-whitespace)

(add-to-list 'load-path "~/.emacs.d/core")
(require 'setup-editing)
(require 'setup-utils)
;; ;; (require 'setup-develop)

;; ;; langs settings
(add-to-list 'load-path "~/.emacs.d/langs")
(require 'setup-org)
;; ;; (require 'setup-cpp)
;; ;; (require 'setup-ruby)
;; ;; (require 'setup-python)
;; ;; (require 'setup-go)

;; ;;; init.el ends here
