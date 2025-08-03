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
(defun klairm/org-add-task (tarea)
  (interactive "sNew task: ") ; interactive is a way to tell emacs that the command can be run interactivly so it can pass the argument from the minibuffer 
    (with-current-buffer (find-file-noselect todo-file)
      (goto-char (point-max))
      (insert (format "\n* TODO %s\n" tarea ))
      (save-buffer)))


