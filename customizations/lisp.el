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


(eval-after-load 'slime
  '(progn
    (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    (add-to-list 'slime-lisp-implementations 
      '(sbcl ("/usr/local/bin/sbcl")))))
            
;; SBCL SLIME custom stuff
(defun sbcl-slime-init ()
  (slime-setup '(slime-repl slime-fuzzy slime-autodoc slime-fancy slime-asdf slime-tramp slime-xref-browser slime-fancy-inspector slime-references)))
  
(defun slime-sbcl ()
  (interactive)
  (sbcl-slime-init)
  (slime 'sbcl))            

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
            
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-startup-animation nil)
