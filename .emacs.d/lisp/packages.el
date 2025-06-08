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

(use-package magit)

(use-package projectile)

(use-package company
  :defer 0.1
  :config
  (global-company-mode t)
  (setq-default
   company-idle-delay 0.05
   company-require-match nil
   company-minimum-prefix-length 0
   company-frontends '(company-preview-frontend)))

(use-package windresize)

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
