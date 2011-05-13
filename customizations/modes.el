;; Haskell
(load (concat dotfiles-dir "vendor/haskell-mode/haskell-site-file"))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Scala
(require 'scala-mode-auto)
(setq yas/my-directory 
  (concat dotfiles-dir "vendor/scala-mode/contrib/yasnippet/snippets"))
(yas/load-directory yas/my-directory)
(add-hook 'scala-mode-hook 
  '(lambda () 
    (yas/minor-mode-on)
    (scala-electric-mode)))


;; ENSIME for Scala
(add-to-list 'load-path (concat dotfiles-dir "vendor/ensime/elisp"))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq exec-path (append exec-path (list "/home/aemon/scala/bin" )))

;; Python
(require 'python)


;; Markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;; Google Protocol Buffers
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))