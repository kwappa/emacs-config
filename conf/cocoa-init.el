;;; environment settings
(if
    (file-readable-p
     (concat user-emacs-directory "conf/cocoa-env.el"))
    (load (concat user-emacs-directory "conf/cocoa-env.el"))
  (setq cocoa-default-font-size 16)
  )

;; disable tool bar and menu bar
(tool-bar-mode  0)
(menu-bar-mode -1)

;; swap Command-Key and Option-Key
(setq ns-command-modifier   (quote meta))
(setq ns-alternate-modifier (quote super))

;; ignore to open new window(frame)
(setq ns-pop-up-frames nil)

;;==============================================================================
;; font setting
;;      あああああいいいいいうううううえええええおおおおお
;;      00112233440011223344001122334400112233440011223344
;;
;; あのイーハトーヴォの
;; すきとおった風、
;; 夏でも底に冷たさをもつ青いそら、
;; うつくしい森で飾られたモーリオ市、
;; 郊外のぎらぎらひかる草の波。
;; 祇辻飴葛蛸鯖鰯噌庖箸
;;==============================================================================
(let* ((fontset-name "ricty") ; フォントセットの名前
       (size cocoa-default-font-size) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       (asciifont "Ricty Diminished") ; ASCIIフォント
       (jpfont    "Ricty Diminished") ; 日本語フォント
       (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont))
       (fsn (create-fontset-from-ascii-font font nil fontset-name)))
  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
  (set-fontset-font fsn '(#x0080 . #x024F) fontspec)    ; 分音符付きラテン
  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)    ; ギリシャ文字
  )
(add-to-list 'default-frame-alist '(font . "fontset-ricty"))
