(require 'python)
(message "Hi22, this is my python-settings")
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;Install Jedi
(add-to-list 'load-path "~/.emacs.d/emacs-jedi/")
(setq jedi:setup-keys t)
(autoload 'jedi:ac-setup "jedi" nil t)
(jedi:ac-setup)

;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; Initialize Rope  TODO:
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

  ;; ;;ipython
  ;; (setq
  ;;  python-shell-interpreter "ipython"
  ;;  python-shell-interpreter-args ""
  ;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  ;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  ;;  python-shell-completion-setup-code
  ;;    "from IPython.core.completerlib import module_completion"
  ;;  python-shell-completion-module-string-code
  ;;    "';'.join(module_completion('''%s'''))\n"
  ;;  python-shell-completion-string-code
  ;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
