(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'eldoc-box-hover-at-point-mode)
(add-hook 'prog-mode-hook #'eglot-ensure)
(add-hook 'prog-mode-hook #'fic-mode)
