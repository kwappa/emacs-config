;;; behavior settings

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

;; ignore visual bell and ring bell
(setq visible-bell nil)
(setq ring-bell-function '(lambda ()))

;; tab setting
(setq-default indent-tabs-mode nil)     ; indent by space
(setq-default tab-width 4)              ; tab width

;;; display settings

;; show column number
(column-number-mode t)

;; linum format
(setq linum-format "%4d ")

;; highlite paren
(show-paren-mode t)

;;; key settings

;; C-h : backspace
(global-set-key "\C-h" 'delete-backward-char)

;; disable commands
(global-unset-key "\C-xm")              ; compose-mail
(global-unset-key "\C-z")               ; suspend-frame

;; assign keyboard macro to function keys
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)

;;; themes
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
(load-theme 'dark-laptop t)
