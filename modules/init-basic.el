;;; init-basic.el --- Fixing weird quirks and poor defaults

;;; Commentary:

;;; Code:
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(setq inhibit-splash-screen t)
(global-hl-line-mode)                   ; highlight cursor line
(blink-cursor-mode -1)

;; Backups
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;; Files and sessions
(setq auto-save-timeout 120)
(setq read-file-name-completion-ignore-case t)
(setq tramp-default-method "ssh")

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system       'utf-8)

(global-font-lock-mode)

(use-package winner
  :config
  (winner-mode))

(global-linum-mode)
(column-number-mode)
(electric-indent-mode -1)

(use-package pos-tip :defer t)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(show-paren-mode 1)

;; (use-package whitespace
;;   :commands whitespace-mode
;;   :config
;;   (modeline-remove-lighter 'whitespace-mode))

;; Align text
;; http://pragmaticemacs.com/emacs/aligning-text/
(defun bjm/align-whitespace (start end)
  "Align columns by whitespace"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)\\s-" 1 0 t))

(defun bjm/align-& (start end)
  "Align columns by ampersand"
  (interactive "r")
  (align-regexp start end
                "\\(\\s-*\\)&" 1 1 t))

(defalias 'yes-or-no-p 'y-or-n-p)

(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)


(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain)

(use-package hippie-expand
  :ensure nil
  :bind ("M-/" . hippie-expand))

;; Byte-Compile
;; https://github.com/itsjeyd/.emacs.d/blob/emacs24/init.el
(defun recompile-elisp-file ()
  (interactive)
  (when (and buffer-file-name (string-match "\\.el" buffer-file-name))
    (let ((byte-file (concat buffer-file-name "\\.elc")))
      (if (or (not (file-exists-p byte-file))
              (file-newer-than-file-p buffer-file-name byte-file))
          (byte-compile-file buffer-file-name)))))
(add-hook 'after-save-hook #'recompile-elisp-file)
(setq load-prefer-newer t)

;; common lisp
(use-package cl-lib)

(provide 'init-basic)
;;; init-basic.el ends here
