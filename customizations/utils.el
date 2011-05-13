;; Enable textmate bindings/tools
(require 'textmate)
(textmate-mode)


;; Autocomplete
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "dict"))
(require 'auto-complete-config)
(ac-flyspell-workaround)
(ac-config-default)
(setq ac-auto-start nil)
(global-set-key "\M-/" 'auto-complete)
(ac-set-trigger-key "TAB")


(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))