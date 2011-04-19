;; Haskell
(load (concat dotfiles-dir "vendor/haskell-mode/haskell-site-file"))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Scala
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook (lambda() (scala-electric-mode)))

;; ENSIME for Scala
(add-to-list 'load-path (concat dotfiles-dir "vendor/ensime/elisp"))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq exec-path (append exec-path (list "/home/aemon/scala/bin" )))

;; Python
(require 'python)