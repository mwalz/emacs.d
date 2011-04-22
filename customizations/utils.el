;; Enable textmate bindings/tools
(require 'textmate)
(textmate-mode)


;; Autocomplete
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "dict"))
(require 'auto-complete-config)
(ac-config-default)