
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(fido-vertical-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)


(setq electric-pair-pairs '((?\" . ?\") (?\{ . ?\})))
(setq visible-bell 1)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq frame-title-format "%f")
(setq gc-cons-threshold (* 50 1000 1000))

(load-theme 'wombat t)
