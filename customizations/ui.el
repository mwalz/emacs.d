;; Color theme config
(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized-dark)
; (eval-after-load "color-theme"
;   '(progn
;     (color-theme-initialize)
;     ;;(color-theme-zenburn)))
;     (color-theme-solarized-dark)))
;     ;;(color-theme-solarized-light)))


;; Revive stuff
(require 'revive)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

;;; Size the window
; (add-to-list 'default-frame-alist '(height . 43))
; (add-to-list 'default-frame-alist '(width . 150))
(set-face-attribute 'default nil :height 180) ; 1/10th, so 160 is 16 point font
  
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 140))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 100)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)


;; Speedbar
(require 'sr-speedbar)
(global-set-key (kbd "s-1") 'sr-speedbar-toggle)
(defun refresh-sr-speedbar-to-default-directory ()
  (interactive)
  (setq sr-speedbar-last-refresh-dictionary default-directory)
  (speedbar-refresh)
  (textmate-clear-cache))
(global-set-key (kbd "s-r") 'refresh-sr-speedbar-to-default-directory)
(sr-speedbar-refresh-turn-off)

;; Add some extensions to speedbar
(speedbar-add-supported-extension ".proto") ;; protocol buffers
(setq speedbar-file-regexp ".*")