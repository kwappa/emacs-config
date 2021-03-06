(setq debug-on-error t)

(let*
    ((user-emacs-directory
      (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
     (conf-list (list
                 "el-get.el"
                 "init.el"
                 )))
  (progn
    (dolist (conf conf-list)
      (load (concat user-emacs-directory "conf/" conf)))
    (and (equal window-system 'ns)
         (dolist (conf (list
                        "cocoa-init.el"
                        ))
           (load (concat user-emacs-directory "conf/" conf))))
    (and (null window-system)
         (dolist (conf (list
                        "nw-init.el"
                        ))
           (load (concat user-emacs-directory "conf/" conf))))))
