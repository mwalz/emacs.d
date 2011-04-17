;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'inf-haskell)


;; Scala
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook (lambda() (scala-electric-mode)))

;; ENSIME for Scala
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq exec-path (append exec-path (list "/home/aemon/scala/bin" )))