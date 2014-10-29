(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync
        '(
          helm
          markdown-mode
          haml-mode
          slim-mode
          coffee-mode
          scss-mode
          rhtml-mode
          undo-tree
          yaml-mode
          haskell-mode
          go-mode
          ))
