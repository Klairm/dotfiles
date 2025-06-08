
(use-package straight
  :custom
  ;; add project and flymake to the pseudo-packages variable so straight.el doesn't download a separate version than what eglot downloads.
  (straight-built-in-pseudo-packages '(emacs nadvice python image-mode project flymake))
  (straight-use-package-by-default t))

(use-package project
  :straight nil)



(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-icon-type 'all-the-icons)
  (setq centaur-tabs-set-icons t))

(use-package eldoc-box
  :hook (prog-mode . eldoc-box-hover-at-point-mode))

(use-package magit
  :ensure t)

(use-package projectile
  :after project)

(use-package company
  :defer 0.1
  :config
  (global-company-mode t)
  (setq-default
   company-idle-delay 0.05
   company-require-match nil
   company-minimum-prefix-length 0
   company-frontends '(company-preview-frontend)))
(use-package company-tabnine
  :after company
  :straight t
  :commands company-tabnine
  :init
  (add-to-list 'company-backends #'company-tabnine)
  :config

  (setq company-idle-delay 0
        company-show-numbers t)


  (setq company-frontends '(company-preview-frontend))
  
)


(use-package tabnine
  :straight (:host github :repo "shuxiao9058/tabnine")
  :commands (tabnine-start-process tabnine-mode)
  :hook (prog-mode . tabnine-mode)
  :config
  (setq tabnine-wait 1
        tabnine-minimum-prefix-length 0)
  (tabnine-start-process)
  (add-hook 'kill-emacs-hook #'tabnine-kill-process)
  (add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)

  (define-key tabnine-completion-map (kbd "<tab>") #'tabnine-accept-completion)
  (define-key tabnine-completion-map (kbd "TAB") #'tabnine-accept-completion)
  (define-key tabnine-completion-map (kbd "M-f") #'tabnine-accept-completion-by-word)
  (define-key tabnine-completion-map (kbd "M-<return>") #'tabnine-accept-completion-by-line)
  (define-key tabnine-completion-map (kbd "C-g") #'tabnine-clear-overlay)
  (define-key tabnine-completion-map (kbd "M-[") #'tabnine-previous-completion)
  (define-key tabnine-completion-map (kbd "M-]") #'tabnine-next-completion))


(use-package windresize
  :ensure t)

(use-package eglot
  :config
  (cl-pushnew '(php-mode . ("intelephense" "--stdio"))
              eglot-server-programs :test #'equal)
  :bind ("C-c f" . eglot-format)
  :hook (prog-mode . eglot-ensure))

(use-package deadgrep
  :bind ("M-s s" . deadgrep))

(use-package org
  :ensure nil)

(use-package org-download
  :bind ("M-o p" . org-download-clipboard)
  :hook (dired-mode-hook . org-download-enable))
