(add-to-list 'load-path "/home/revir/.emacs.d/cedet-bzr/trunk/")

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;shortcut key
(global-set-key (kbd "C-=")  'senator-fold-tag)
(global-set-key (kbd "C--")  'senator-unfold-tag)
(global-set-key (kbd "M-/") 'semantic-ia-complete-symbol-menu)
(global-set-key [M-f2] 'semantic-analyze-proto-impl-toggle)
(global-set-key [f2] 'semantic-ia-fast-jump)
(global-set-key [S-f2]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(global-set-key (kbd "M-r") 'semantic-symref-symbol)

(defconst cedet-user-include-dirs
  (list "." ".." "../include" "../../include" 
        "~/workspace/new/safesitetask" "~/workspace/new/safesitetask/include"
        "~/workspace/new/safesitetask/utils/third_party/"
        "../inc" "../../inc" "../common" "../public"
        "../../common" "../../public" ))
;;(require 'semantic-c nil 'noerror) 
;;(require 'semantic-c++  nil 'noerror)
(defun semantic-hook-add-inc ()
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        cedet-user-include-dirs))
(add-hook 'semantic-init-hooks 'semantic-hook-add-inc)


(defun cedet-c-settings ()
  (message "Hi, cedet-c-settings")
  (load-file "~/.emacs.d/cedet-bzr/trunk/cedet-devel-load.el")
  (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                    global-semanticdb-minor-mode
                                    global-semantic-idle-summary-mode
                                    global-semantic-mru-bookmark-mode
                                    global-semantic-stickyfunc-mode
                                    global-semantic-tag-folding-mode 
                                    global-semantic-decoration-mode
                                    global-semantic-idle-local-symbol-highlight-mode
                                    global-semantic-idle-scheduler-mode
                                    global-semantic-idle-summary-mode  ;;show tag/function information on minibuffer.
                                    global-semantic-idle-completions-mode

                                    ;;
                                    global-semantic-show-unmatched-syntax-mode
                                    global-semantic-show-parser-state-mode
                                    ))
  (semantic-mode 1)

  (setq-mode-local c-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))

  (setq-mode-local c-mode semanticdb-find-default-throttle
                   '(project unloaded system recursive))
  ;; if you want to enable support for gnu global
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode)
  ;; enable ctags for some languages:
  ;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
  (when (cedet-ectag-version-check)
    (semantic-load-enable-primary-exuberent-ctags-support))

  (require 'semantic/ia)
  (require 'semantic/bovine/gcc))

(defun cedet-javascript-settings ()
  (message "Hi, cedet-javascript-settings")
  (semantic-mode nil))


(eval-after-load "cc-mode"
  '(cedet-c-settings))

(add-hook 'js-mode-hook 'cedet-javascript-settings)

(provide 'my-cedet-settings)
