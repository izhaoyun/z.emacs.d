;; Package: python-mode
(el-get-bundle python-mode)
(require 'python-mode)
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; Package: jedi
(el-get-bundle jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)

(provide 'init-python)
