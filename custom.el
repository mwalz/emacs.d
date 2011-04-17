(add-to-list 'package-archives
  '("technomancy" . "http://repo.technomancy.us/emacs/") t)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/") t)             
          
(defun new-line-at-cursor ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
  
;;; Import environmental stuff on the Mac, since .app doesn't do it by default
(when (equal system-type 'darwin)
  (setenv "PATH" (getenv "PATH"))
  (push "/usr/local/bin" exec-path))

(require 'slime)
; (slime-setup '(slime-repl slime-fuzzy))

(setq query-replace-highlight t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq display-time-day-and-date t) (display-time)
(setq search-highlight t)
(setq scroll-step 1)
(setq scroll-conservatively 5)

(global-set-key [delete] 'delete-char)
(display-time-mode t)
(transient-mark-mode t)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-m") 'newline-and-indent) 
(global-set-key (kbd "C-x C-r") 'find-file-read-only)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "<s-return>") 'new-line-at-cursor)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
