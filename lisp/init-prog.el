;;; ubiquitous settings for programming

;; ==========================================================================
;; Yasnippet
;; Package: yasnippet
(el-get-bundle yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/el-get/yasnippet/snippets"))
(yas-global-mode 1)

;; ==========================================================================
;; Package: comment-dwim-2
(el-get-bundle comment-dwim-2)
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; ==========================================================================
;; Parenthesis
(show-paren-mode 1)

;; Package: smartparens
(el-get-bundle smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode t)
(smartparens-global-mode 1)
;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;; Package: rainbow-delimiters
(el-get-bundle rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ==========================================================================
;; Indentation
(global-set-key (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda ()
			    (interactive)
			    (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Package: clean-aindent-mode
(el-get-bundle clean-aindent-mode)
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(el-get-bundle dtrt-indent)
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; ==========================================================================
;; Version control
;; Package: magit
(el-get-bundle magit)
(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/el-get/magit/Documentation/"))
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; ==========================================================================
;; Navigation
;; Package: avy
(el-get-bundle avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(avy-setup-default)

;; ==========================================================================
;; Miscellaneous packages

;; Package: ws-butler
(el-get-bundle ws-butler)
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; Package: sublimity
(el-get-bundle sublimity)
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)
(require 'sublimity-attractive)
(setq sublimity-map-size 20)
(setq sublimity-map-fraction 0.3)
(setq sublimity-map-text-scale -7)
;(sublimity-mode 1)

(provide 'init-prog)