;;; init-swiper.el --- Swiper

;;; Commentary:

;;; Code:
(el-get-bundle swiper)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s")     'swiper)
(global-set-key (kbd "C-r")     'ivy-resume)
(global-set-key (kbd "M-x")     'counsel-M-x)
(global-set-key (kbd "M-y")     'counsel-yank-pop)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h K")   'counsel-descbinds)
(global-set-key (kbd "<f1> f")  'counsel-describe-function)
(global-set-key (kbd "<f1> v")  'counsel-describe-variable)
(global-set-key (kbd "<f1> l")  'counsel-load-library)
(global-set-key (kbd "<f2> i")  'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u")  'counsel-unicode-char)
(global-set-key (kbd "C-c s g") 'counsel-git)
(global-set-key (kbd "C-c s j") 'counsel-git-grep)
(global-set-key (kbd "C-c s a") 'counsel-ag)
(global-set-key (kbd "C-c s l") 'counsel-locate)
(global-set-key (kbd "C-c d k") 'counsel-descbinds)
(global-set-key (kbd "C-c d f") 'counsel-describe-function)
(global-set-key (kbd "C-c d v") 'counsel-describe-variable)

(define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-occur)

(provide 'init-swiper)
;;; init-swiper.el ends here
