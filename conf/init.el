;;; behavior settings

;; local and default encoding
(set-locale-environment nil)
(set-default-coding-systems 'utf-8)

;; load-path
(add-to-list 'load-path (concat user-emacs-directory "/elisp"))

;; do not create backup file
(setq auto-save-default nil)            ; # files
(setq make-backup-files nil)            ; ~ files

;; scroll setting
(setq scroll-conservatively 35
      scroll-margin          0
      scroll-step            1)
(setq comint-scroll-show-maximum-output t)

;; enable auto revert
(global-auto-revert-mode 1)

;; ignore visual bell and ring bell
(setq visible-bell nil)
(setq ring-bell-function '(lambda ()))

;; tab setting
(setq-default indent-tabs-mode nil)     ; indent by space
(setq-default tab-width 4)              ; tab width

;; helm-mode
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(load "term/bobcat")                    ; disable help by C-h at minibuffer
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; dired
(load "dired-x")
;; show directory on top
(load-library "ls-lisp")
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-dirs-first t)
;; up to parent directory : delete, C-h
(define-key dired-mode-map "\d"   'dired-up-directory)
(define-key dired-mode-map "\C-h" 'dired-up-directory)

;;; display settings

;; show column number
(column-number-mode t)

;; linum format
(setq linum-format "%4d ")

;; highlite paren
(show-paren-mode t)

;; color setting
(load "color-setting")

;;; key settings

;; C-h : backspace
(global-set-key "\C-h" 'delete-backward-char)

;; disable commands
(global-unset-key "\C-xm")              ; compose-mail
(global-unset-key "\C-z")               ; suspend-frame

;; next / previous window
(global-set-key "\M-n" 'next-multiframe-window)
(global-set-key "\M-p" 'previous-multiframe-window)

;; assign keyboard macro to function keys
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)

;; disable 'toggle-input-mode' and assign C-\
(global-set-key "\C-\\" 'delete-horizontal-space)

;; undo / redo
(global-set-key (kbd "C-/")   'undo)    ; for cocoa
(global-set-key (kbd "C-M-/") 'redo)    ; for cocoa
(global-set-key (kbd "C-_")   'undo)    ; for terminal
(global-set-key (kbd "C-M-_") 'redo)    ; for terminal

;;; themes
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
(load-theme 'dark-laptop t)

;;; indent
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "k&r")
             (c-set-offset 'case-label     '+)
             (c-set-offset 'inline-open     0)
             (c-set-offset 'statement-cont  0)
             (c-set-offset 'arglist-close   0)
             (c-set-offset 'inexpr-class    0)
             (setq c-basic-offset 4 indent-tabs-mode nil)
             ))
;; ruby indent
(load "ruby-indent")

;;; my functions
(load "my-functions")
;; toggle truncate
(global-set-key [f8] 'my-toggle-truncate)
;; page-up / down like WZ
(global-set-key "\C-v" 'my-scroll-up)
(global-set-key "\M-v" 'my-scroll-down)
;; draw line
(global-set-key "\C-cf" 'my-draw-line)

;;; auto-mode-alist
(setq auto-mode-alist
      (append '(
                ("Rakefile" . ruby-mode)
                ("Gemfile"  . ruby-mode)
                ("\\.ru$"   . ruby-mode)
                )
              auto-mode-alist))
