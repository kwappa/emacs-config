;; highlite current line
(defface hlline-face  '((t (:background "dark slate gray"))) nil)
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; diff-mode
(defun diff-mode-setup-faces ()
  (set-face-attribute 'diff-added-face nil
                      :foreground "green"
                      :background nil
                      :weight 'normal)
  (set-face-attribute 'diff-removed-face nil
                      :foreground "firebrick1"
                      :background nil
                      :weight 'normal)
  (set-face-attribute 'diff-refine-change nil
                      :background "gray12"
                      :weight 'extra-bold)
  (set-face-attribute 'diff-header-face nil
                      :background "midnight blue")
  (set-face-attribute 'diff-file-header-face nil
                      :foreground "DarkOrange1"
                      :background "midnight blue"
                      :weight 'extra-bold)
  (set-face-attribute 'diff-hunk-header-face nil
                      :foreground "deep sky blue"
                      :background "midnight blue"
                      :weight 'extra-bold)
  )
(add-hook 'diff-mode-hook 'diff-mode-setup-faces)
