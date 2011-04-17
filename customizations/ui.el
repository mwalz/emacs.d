;; Color theme config
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
    (color-theme-initialize)
    ;;(color-theme-zenburn)))
    (color-theme-solarized-dark)))
    ;;(color-theme-solarized-light)))


;; Revive stuff
(require 'revive)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

;;; Size the window
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))
(set-face-attribute 'default nil :height 160) ; 1/10th, so 160 is 16 point font
