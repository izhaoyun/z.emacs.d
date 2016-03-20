;;; init-packages.el --- initialize packages

;;; Commentary:

;;; Code:
(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init
  (progn
    (setq undo-tree-visualizer-diff       t)
    (setq undo-tree-visualizer-timestamps t))
  :config
  (progn (global-undo-tree-mode)))

(use-package expand-region
  :commands er/expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package window-numbering
  :init
  (window-numbering-mode))

(use-package smart-mode-line
  :defer t
  :init
  (progn
    (setq sml/them 'light)
    (setq sml/no-confirm-load-theme t)
    (sml/setup)))

;; (use-package smartparens
;;   :init
;;   (use-package smartparens-config
;;     :ensure smartparens)
;;   (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;   (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode))



;; (use-package helm
;;   :init
;;   (setq helm-yas-display-key-on-candidate t
;;         helm-quick-update t
;;         helm-M-x-requires-pattern nil
;;         helm-apropos-fuzzy-match  t
;;         helm-ff-skip-boring-files t)
;;   (use-package helm-config :ensure helm)
;;   :bind
;;   (("C-c h" . helm-mini)
;;    ("C-c f" . helm-recentf)
;;    ("C-h a" . helm-apropos)
;;    ("C-h M" . helm-man-woman)
;;    ("C-x C-b" . helm-buffers-list)
;;    ("C-x c y" . helm-yas-complete)
;;    ("C-x c Y" . helm-yas-create-snippet-on-region)
;;    ("C-x c SPC" . helm-all-mark-rings))
;;   :config
;;   (helm-mode)
;;   )

(use-package helm
  :config

  (use-package helm-config
    :ensure helm)

  (use-package helm-dash
    :bind ("C-c d" . helm-dash-at-point)
    :init
    (setq helm-dash-docsets-path "~/Dropbox/docsets/"))

  (use-package helm-make
    :init (setq helm-make-completion-method 'ivy))
  )


;; (use-package hlem-swoop
;;     :bind (("M-i" . helm-swoop)
;;            ("M-I" . helm-swoop-back-to-last-point)
;;            ("C-c M-i" . helm-multi-swoop)
;;            ("C-x M-i" . helm-multi-swoop-all)))

;; Package: swiper
(use-package counsel
  :bind (("C-s" . swiper)
         ("C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-x C-f" . counsel-find-file)
         ("C-h K"   . counsel-descbinds)
         ("C-h S"   . counsel-info-lookup-symbol)
         ("C-h l"   . counsel-load-library)
         ("C-c s a" . counsel-ag)
         ("C-c s g" . counsel-git)
         ("C-c s j" . counsel-git-grep)
         ("C-c s l" . counsel-locate))
  :bind (:map help-map
              ("f" . counsel-describe-function)
              ("v" . counsel-describe-variable))
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (setq counsel-find-file-at-point t)
  :config
  (ivy-mode))

;; Hydra
(use-package hydra :defer t)

;; Package: avy
(use-package avy
  :defer t
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("M-p" . avy-pop-mark))
  :init
  (progn
    (avy-setup-default)
    (setq avy-all-windows nil)
    (setq avy-timeout-seconds 0.8))
  :config
  (advice-add 'swiper :before 'avy-push-mark)

  ;; Package: avy-zap
  (use-package avy-zap
    :bind ("M-z" . avy-zap-up-char-dwim))

  ;; Package: ace-pinyin
  (use-package ace-pinyin
    :init
    (setq ace-pinyin-use-avy t)
    :config
    (ace-pinyin-global-mode))
  )



;; which-key
(use-package which-key
  :defer 3
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; Package: yasnippet
(use-package yasnippet
  :diminish yas-minor-mode
  :defer t
  :commands yas-minor-mode
  :init
  (setq yas-verbosity 0)
  (setq yas-fallback-behavior 'return-nil)
  (setq yas-triggers-in-field t)
  (setq yas-snippet-dirs "~/.emacs.d/snippets")
  :config
  (progn
    (define-key yas-minor-mode-map [(tab)] nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (yas-global-mode)))

;; Package: projectile
(use-package projectile
  :defer t
  :init
  (progn
    (setq projectile-enable-caching t)
    (setq projectile-completion-system 'ivy)
    (setq projectile-indexing-method 'alien)
    (projectile-global-mode)))

;; Package: magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-status-with-prefix))
  :init
  (setq magit-completing-read-function 'ivy-completing-read))

;; Package: comment-dwim-2
(use-package comment-dwim-2
  :defer t
  :bind
  ("M-;" . comment-dwim-2))

;; Package: company
(use-package company
  :defer t
  :init
  (setq company-show-numbers t)
  :config
  ;; (progn
    ;; no need to enable company-mode globally. maybe it's better to
    ;; have more than one auto complete packages for different modes.
    ;; (global-company-mode)
    ;; )
  )

(provide 'init-packages)
;;; init-packages.el ends here
