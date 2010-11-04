(defun add-subdirs-to-load-path (dir)
    (let ((default-directory (concat dir "/")))
          (normal-top-level-add-subdirs-to-load-path)))
          
(defun new-line-at-cursor ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
  
;;; Import environmental stuff on the Mac, since .app doesn't do it by default
(when (equal system-type 'darwin)
  (setenv "PATH" (getenv "PATH"))
  (push "/usr/local/bin" exec-path))
          
;;; Size the window
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 170))
(set-face-attribute 'default nil :height 160) ; 1/10th, so 160 is 16 point font

(setq inferior-lisp-program "/usr/local/bin/sbcl"
     ;; Change me!
     slime-path (expand-file-name "~/.emacs.d/vendor/slime/")
     w3m-command "/usr/local/bin/w3m"
     cltl2-url "file:///usr/share/doc/cltl/clm/node1.html"
     hyperspec-prog (concat slime-path "hyperspec")
     hyperspec-path "/usr/share/doc/hyperspec/"
     lisp-indent-function 'common-lisp-indent-function
     slime-complete-symbol-function 'slime-fuzzy-complete-symbol
     common-lisp-hyperspec-root (concat "file://" hyperspec-path)
     common-lisp-hyperspec-symbol-table (concat hyperspec-path "Data/Map_Sym.txt")
     w3m-default-homepage "file:///usr/share/doc/hyperspec/Front/X_Symbol.htm"
     browse-url-browser-function '(("." . w3m-browse-url-other-window))
     w3m-symbol 'w3m-default-symbol
     w3m-key-binding 'info
     w3m-coding-system 'utf-8
     w3m-default-coding-system 'utf-8
     w3m-file-coding-system 'utf-8
     w3m-file-name-coding-system 'utf-8
     w3m-terminal-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-subdirs-to-load-path "~/.emacs.d/vendor")


(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib")

;; Haskell stuff
(load "~/.emacs.d/vendor/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)    
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)  
(require 'inf-haskell)                                      


(require 'slime)
(slime-setup '(slime-repl slime-fuzzy))

(eval-after-load 'slime
  '(progn
    (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    (add-to-list 'slime-lisp-implementations 
                          '(sbcl ("/usr/local/bin/sbcl")))))


;; Clojure SLIME custom stuff
(defun lein-swank ()
  (interactive)    
  (swank-clojure-init "lein")
  (let ((root (locate-dominating-file default-directory "project.clj")))
    (when (not root)
      (error "Not in a Leiningen project."))
    ;; you can customize slime-port using .dir-locals.el
    (shell-command (format "cd '%s' && /Users/ilya/local/bin/lein swank %s &" root 4005)
                   "*lein-swank*")
    ; (shell-command (format "cd %s && /Users/ilya/local/bin/lein repl &" root)
    ;                "*lein-repl*")
    (set-process-filter (get-buffer-process "*lein-swank*")
                        (lambda (process output)
                          (when (string-match "Connection opened on" output)
                            (slime-connect "localhost" 4005)
                            (set-process-filter process nil))))
    (slime-redirect-inferior-output)                        
    (message "Starting lein swank server...")))


;; Clojure SLIME custom stuff
(defun cake-swank ()
  (interactive)
  (swank-clojure-init "cake")
  (shell-command (format "cd '%s' && /Users/ilya/local/bin/cake swank &" default-directory)
                 "*cake-swank*")                               
  (set-process-filter (get-buffer-process "*cake-swank*")
                        (lambda (process output)
                          (when (string-match "on port 4005" output)
                            (slime-connect "localhost" 4005)
                            (set-process-filter process nil))))
  ;; Start inferior lisp, might be a better way???  
  ; (setq inferior-lisp-process (get-process "inferior-lisp"))
  ; (slime-redirect-inferior-output)
  (message "Starting cake swank server..."))

(defun swank-clojure-init (type)
  (slime-setup '(slime-repl slime-fuzzy))
  (require 'inferior-slime)
  (setq inferior-lisp-program (format "~/local/bin/%s repl" type)))
    
    
;; SBCL SLIME custom stuff
(defun sbcl-slime-init ()
  (slime-setup '(slime-repl slime-fuzzy slime-autodoc slime-fancy slime-asdf slime-tramp slime-xref-browser slime-fancy-inspector slime-references)))
  
(defun slime-sbcl ()
  (interactive)
  (sbcl-slime-init)
  (slime 'sbcl))            

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

; (slime-setup '(slime-repl slime-fuzzy slime-repl))

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-startup-animation nil)
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


;; (require 'clojure-test-mode)


;;; Color theme config

; (require 'color-theme)
; (color-theme-initialize)
; (color-theme-charcoal-black)
; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
; (add-to-list 'load-path "/Users/ilya/.emacs.d/vendor/color-theme/color-theme.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
      (color-theme-initialize)
      (color-theme-zenburn)))

;;; Project revive stuff
(require 'revive)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
;;Keyboard shortcuts
(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)
