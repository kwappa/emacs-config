;===============================================================================
;; Page up / downをWZ風味に
;===============================================================================
(defun my-scroll-up()
  "my scroll up"
  (interactive)
  (condition-case err                   ; scroll-upに失敗したらバッファ末尾へ
      (scroll-up)
    (end-of-buffer                      ; エラーの種類
     (goto-char (point-max))))
  )
(defun my-scroll-down()
  "my scroll down"
  (interactive)
  (condition-case err                   ; scroll-downに失敗したらバッファ先頭へ
      (scroll-down)
    (beginning-of-buffer                ; エラーの種類
     (goto-char (point-min))))
  )

;===============================================================================
;; 入力文字で80桁までfill
;===============================================================================
(defun my-draw-line ()
  "Fill characters until column less than 80."
  (interactive)
  (setq fill-string (read-from-minibuffer "fill character : "))
  (if (> (length fill-string) 0)
      (progn
        (setq col (current-column))     ; 現在のカラム位置を取得
        (setq eol (- (progn (end-of-line) (current-column)) col)) ; 行末を取得
        (move-to-column col)            ; 元の位置に戻す
        (while (< (current-column) (- 80 eol))
          (insert fill-string))         ; 行末が80桁になるまでfill
        )))

;===============================================================================
;; 折り返しのトグル
;===============================================================================
(defun my-toggle-truncate()
  "toggle truncate"
  (interactive)
  (progn
    (if truncate-lines
        (progn
          (setq truncate-lines nil)
          (setq truncate-partial-width-windows nil))
      (progn
        (setq truncate-lines t)
        (setq truncate-partial-width-windows t)))
    (message "truncate-mode : %s" truncate-lines)))

;===============================================================================
;; Ruby hash rocketを1.9記法に置換
;===============================================================================
(defun ruby-anti-hash-rocket ()
  (interactive)
  (beginning-of-line)
  (setq current-line (count-lines (point-min) (point)))
  (setq replaced (replace-regexp-in-string ":\\([a-z0-9_]+\\)\s*=>" "\\1:" (buffer-string)))
  (erase-buffer)
  (insert replaced)
  (goto-line (+ 1 current-line))
  (beginning-of-line)
  )
