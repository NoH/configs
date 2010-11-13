(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Profont-9"))

(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'haskell-mode-hook          (lambda () (paredit-mode +1)))
;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

(setq verilog-linter "iverilog -o ")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq inhibit-startup-message t)
(setq ring-bell-function 'scroll-lock-blink)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/yas")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "/usr/share/emacs/site-lisp/yas/snippets")

(require 'paren)
(show-paren-mode 1)

;;I love color themes, use M-x color-theme-select to select a theme
(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
     (add-to-list 'load-path "~/lisp/slime/")  ; your SLIME directory
     (require 'slime)
     (slime-setup)
(require 'color-theme);; Define a -hook for all modes where we want tab completion.
(add-hook 'c-mode-common-hook
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))
(add-hook 'c-mode-hook
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))
(add-hook 'text-mode-hook
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))
(add-hook 'emacs-lisp-mode-hook 
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))
(add-hook 'LaTeX-mode-hook 
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))
(add-hook 'TeX-mode-hook 
          (function (lambda ()
                    (local-set-key (kbd "") 'indent-or-complete)
                     )))

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "\\>")
    (dabbrev-complete)
  (indent-for-tab-command)
   ))
;; Set the dictionary for the spell check.
;;(setq flyspell-mode-hook
;;      '(lambda () "Sets the dictionary for flyspell on startup."
;;	 (ispell-change-dictionary "svenska")))

(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
;; Can be found at http://jdhuntington.com/paste/color-theme-blackboard.el.html
(color-theme-blackboard)

;;No more typing yes or no, y or n is sufficent from now on
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'rcirc)

;; Don't print /away messages.
;; This does not require rcirc to be loaded already,
;; since rcirc doesn't define a 301 handler (yet).
(defun rcirc-handler-301 (process cmd sender args)
  "/away message handler.")

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook (lambda ()
			     (flyspell-mode 1)))

;; Keep input line at bottom.                                                                               
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (set (make-local-variable 'scroll-conservatively)
		 8192)))

;; Turn on logging everything to a special buffer, for debugging.
(setq rcirc-debug-flag t)

;; Adjust the colours of one of the faces.
(set-face-foreground 'rcirc-my-nick "red" nil)

;; Include date in time stamp.
(setq rcirc-time-format "%Y-%m-%d %H:%M ")

;; Change user info
(setq rcirc-default-nick "Nibble")
(setq rcirc-default-user-name "Nibble")
(setq rcirc-default-full-name "Nibble")

;; Join these channels at startup.
(setq rcirc-startup-channels-alist
      '(("\\.freenode\\.net$" "#emacs" "#haskell" "#xcb")
	("\\.ninthbit\\.net$" "#offtopic" "#programming")))

;; Connect to servers.
(defun my-rcirc-connect()
  (interactive)
  (rcirc "irc.freenode.net")
  (rcirc-connect "irc.ninthbit.net"))

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'tcl-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

(defun turn-on-flyspell ()
   "Force flyspell-mode on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))

;; Highlight current line
(add-hook 'message-mode-hook (lambda () (hl-line-mode 1)))
(add-hook 'text-mode-hook (lambda () (hl-line-mode 1)))
(add-hook 'c-mode-hook (lambda () (hl-line-mode 1)))
(add-hook 'tcl-mode-hook (lambda () (hl-line-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (hl-line-mode 1)))
(load "~/.emacs.d/haskell-mode/haskell-site-file.el")

(setq haskell-program-name "/usr/bin/ghci")
(setq haskell-doc-show-global-types 1)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook (lambda () (haskell-doc-show-global-types 1)))
(setq c-mode-hook
    (function (lambda ()
                (setq c-indent-level 4))))
(setq flymake-allowed-file-name-masks
           (cons '(".+\\.c$"
                   flymake-simple-make-init
                   flymake-simple-cleanup
                   flymake-get-real-file-name)
                 flymake-allowed-file-name-masks))
