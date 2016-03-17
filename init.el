;;; init.el
(setq gc-cons-threshold 100000000)

;; load path etc.
(require 'package)
(setq package-archives '(("popkit" . "http://elpa.popkit.org/packages/")))
(package-initialize)
(setq package-enable-at-startup nil)
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
;; (require 'use-package)

;; load settings for Emacs
(add-to-list 'load-path "~/.emacs.d/settings")
(require 'init-basic)
(require 'init-packages)
;; (require 'init-keys)

;; load modules for different programming languages
(add-to-list 'load-path "~/.emacs.d/modules")

;; (require 'init-flycheck)
;; (require 'init-web)
;; (require 'init-org)
;; (require 'init-cc)
;; (require 'init-python)
;; (require 'init-ruby)

;;; init.el ends here
