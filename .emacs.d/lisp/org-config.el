(setq org-directory "~/MEGA/Notes")
(setq todo-file (concat org-directory "/todo.org"))
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DROPPED" "DONE")))
(setq org-capture-templates
      '(("t" "Copy to the TODO list" entry
         (file todo-file)
         "%i\n  "
         :immediate-finish t
         :kill-contents t)))
