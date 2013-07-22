(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

(add-to-list 'load-path "~/.emacs.d/dea-lisp/")
(require 'ahei-misc)
;;======cedet
;;A gental introduction to cedet. see: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
(require 'my-cedet-settings)

;;An easy method of running Makefiles.
(require 'makefile-runner)  

;;sourcepair
(load-file "~/.emacs.d/sourcepair.el")
(global-set-key [f4] 'sourcepair-load)
(define-key global-map [f1] 'sourcepair-load)
(setq sourcepair-source-path '( "." "~/workspace/new/safesitetask/*"))
(setq sourcepair-header-path '("." "~/workspace/new/safesitetask/include/*"))
(setq sourcepair-recurse-ignore '("CVS" "bin" "lib" "Obj" "Debug" "Release" "out" ".svn"))

;;speedbar
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)

(add-hook 'speedbar-mode-hook
        (lambda ()
         (auto-raise-mode 1)
         (add-to-list 'speedbar-frame-parameters '(top . 0))
         (add-to-list 'speedbar-frame-parameters '(left . 0))
         ;;(setq speedbar-show-unknown-files t)
         (speedbar-add-supported-extension '(".sh" ".json" ".css" ".cfg" ".config"))
         ))

(setq speedbar-tag-hierarchy-method '(speedbar-prefix-group-tag-hierarchy))

;;==============================
(load "my-base.el")

;;autocomplete
(require 'my-auto-complete-setting)

;;==============================
;;python mode: from fgallina/python.el
;;(require 'my-python-settings)
(autoload 'python-mode "my-python-settings" "" t)
;;set python indent
(setq-default python-indent-offset 4)

(add-hook 'python-mode-hook
          (lambda ()
            (message "Hi, add jedi:ac-setup!!!!")
            (jedi-mode t)
            (jedi:ac-setup)
            (add-to-list 'ac-sources 'ac-source-jedi-direct)))

;;==============================
;;js2-mode BUGFIX:
;; (add-to-list 'load-path "~/.emacs.d/elpa/js2-mode-20130510")
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-charcoal-black)))

;;===============================
;;for el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)
(setq el-get-user-package-directory "/home/revir/.emacs.d/el-get-init-files/")

;;Marmalade is a package archive for Emacs Lisp. see:http://marmalade-repo.org/
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;;==============================
;;tabbar
(add-to-list 'load-path "/home/revir/.emacs.d/tabbar/")
(require 'tabbar)
(tabbar-mode)
(define-prefix-command 'lwindow-map)
(global-set-key (kbd "<M-up>") 'tabbar-backward-group)
(global-set-key (kbd "<M-down>") 'tabbar-forward-group)
(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)

;;outline
;; (require 'outline-settings)

;;==============================
(require 'compile-settings)

;;==============================
;; BUGFIX:
;;(require 'js-beautify)

;;===============================
;;json formator
(defun json-format ()
  (interactive)
  (save-excursion
	(shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
	))

;;===============================
;;实现搜索选中文字
(defun wcy-define-key-in-transient-mode (global-p key cmd-mark-active  cmd-mark-no-active)
  (funcall (if global-p 'global-set-key 'local-set-key)
           key
           `(lambda ()
              (interactive)
              (if mark-active
                  (call-interactively ',cmd-mark-active)
                (call-interactively ',cmd-mark-no-active)))))

(defun wcy-isearch-forward-on-selection (&optional regexp-p no-recursive-edit)
  (interactive "P\np")
  (let ((text (buffer-substring (point) (mark))))
    (goto-char (min (point) (mark)))
    (setq mark-active nil)
    (isearch-mode t (not (null regexp-p)) nil (not no-recursive-edit))
    (isearch-process-search-string text text)))

(wcy-define-key-in-transient-mode t (kbd "C-s")
                                  'wcy-isearch-forward-on-selection
                                  'isearch-forward)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("7c09d29d8083ecd56b9d5c1a4b887aa2b0dfbe20412b64047686da6711d850bd" default)))
 '(safe-local-variable-values (quote ((py-which-shell . "python3") (encoding . utf-8))))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
