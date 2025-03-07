
;; UI and normal functionalities configs
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fido-vertical-mode 1)
(setq create-lockfiles nil)
; TURN OFF THE BEEP
(setq visible-bell 1)

(setq gc-cons-threshold (* 50 1000 1000))  ;; Increase garbage collection threshold 


(require 'package)
   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; Sets the directory for the agenda note sin org-mode, so I can list all the TODOS from those files
(setq org-directory "~/MEGA/Notes")
(setq todo-file (concat org-directory "/todo.org" ))
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))

; Custom Keybindings
(global-set-key (kbd "C-c c") 'org-capture)

; Made this template to move todo items from org files that I would export so is not there when sharing the content
(setq org-capture-templates
      '(("t" "Copy to the TODO list" entry
         (file todo-file)
         "%i\n  "
	 :immediate-finish t
	  :kill-contents t
	 )))

(use-package eldoc-box
  :ensure t
  :hook (prog-mode . eldoc-box-hover-at-point-mode  )
  )
(use-package magit
  :ensure t)

(use-package projectile
  :ensure t)
(use-package eglot
  :ensure t
  :bind ( "C-c f" . eglot-format) 
  :config
    (cl-pushnew '(php-mode . ("intelephense" "--stdio"))
              eglot-server-programs
              :test #'equal)
  :hook (prog-mode . eglot-ensure))


(use-package company
  :ensure t
  :hook (prog-mode . company-mode))

(use-package adaptive-wrap
  :ensure t
  :hook ( ( org-mode . adaptive-wrap-prefix-mode)
	  ( prog-mode . adaptive-wrap-prefix-mode)
	  ( text-mode . adaptive-wrap-prefix-mode) ))
(use-package windresize
  :ensure t)

(use-package org
  :ensure nil
  :bind ("C-c t" . org-todo-list)
  )

(use-package org-download
  :ensure t
  :bind ("M-o p" . org-download-clipboard)
  :hook (dired-mode-hook . org-download-enable)
  )



(load-theme 'wombat)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3" default))
 '(package-selected-packages
   '(org-agenda adaptive-wrap clang-format org-drawio bash-completion company kotlin-mode php-cs-fixer php-eldoc phpactor vterm colormaps gruvbox-theme magit ag imenu-list twig-mode treemacs-projectile php-mode calibre org-download typescript-mode windresize eglot-java eglot projectile eldoc-box use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
