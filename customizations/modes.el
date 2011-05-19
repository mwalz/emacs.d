;; Haskell
(load (concat dotfiles-dir "vendor/haskell-mode/haskell-site-file"))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Scala
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook 
  '(lambda () 
    (yas/minor-mode-on)
    (scala-electric-mode)))


;; ENSIME for Scala
(add-to-list 'load-path (concat dotfiles-dir "vendor/ensime/elisp"))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq exec-path (append exec-path (list "~/local/typesafe-stack/bin" )))

;; Python
(require 'python)


;; Markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


;; Google Protocol Buffers
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))