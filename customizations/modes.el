;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'inf-haskell)


;; Scala
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook (lambda() (scala-electric-mode)))

;; ENSIME for Scala
; (require 'ensime)
; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
