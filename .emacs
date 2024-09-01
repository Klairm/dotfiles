(require 'package)
   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package eldoc-box
  :ensure t
  :hook (prog-mode . eldoc-box-hover-at-point-mode  )
  )

(use-package eglot
  :ensure t
  :hook (prog-mode . eglot-ensure))
(use-package windresize
  :ensure t)
(use-package typescript-mode
  :ensure t)
(use-package ox-gfm
  :ensure t)

(use-package org-download
  :ensure t
  :bind ("M-o p" . org-download-clipboard))

(use-package langtool
  :ensure t
  :config
  (setq langtool-language-tool-jar "~/.languagetool/languagetool-commandline.jar")
  :init
  (defun org-lg-hook ()
    (add-hook 'before-save-hook 'langtool-check-buffer nil 'local))
  :hook (org-mode . org-lg-hook))


(use-package corfu
  :ensure t
    :custom
    (corfu-auto t)
    (corfu-auto-delay .18)
    (corfu-auto-prefix 2)
    (corfu-cycle t)
    (corfu-preselect 'prompt)
    :hook ((eglot-managed-mode emacs-lisp-mode) . corfu-mode))


;; UI and normal functionalities configs
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

;; auto-close parenthesis and brackets
(electric-pair-mode 1)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))

(tool-bar-mode 0)


(add-hook 'dired-mode-hook 'org-download-enable)

;; ---




(defun custom-java-stuff ()
  (auto-fill-mode)
  (yas-minor-mode)
  (company-mode)
  (company-yasnippet)
  
   )

(add-hook 'java-mode-hook 'eglot-java-mode)
 (with-eval-after-load 'eglot-java
   (define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
   (define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
   (define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
   (define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
   (define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
   (define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh))

 (add-hook 'eglot-java-mode 'custom-java-stuff)
(with-eval-after-load 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox))
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" default))
 '(doc-view-continuous t)
 '(org-agenda-files '("~/hi.org"))
 '(org-export-backends '(ascii html latex md odt org))
 '(package-selected-packages
   '(langtool languagetool org-download ox-gfm ox-md eglot-java-mode yasnippet-snippets company yasnippet treemacs eglot-java windresize ng2-mode corfu eldoc-box magit gruvbox-theme eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
