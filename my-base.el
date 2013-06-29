;; ;;允许使用C-z作为命令前缀  
;; (define-prefix-command 'ctl-z-map)  
;; (global-set-key (kbd "C-z") 'ctl-z-map) 
;; ;;用C-z i快速打开~/.emacs文件。  
;; (defun open-init-file ( )  
;;   (interactive)  
;;   (find-file "~/.emacs"))  
;; (global-set-key "\C-zi" 'open-init-file)

;;Some shortcut key
(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info)
(global-set-key [f3] 'grep-find)
(global-set-key [C-f4] 'kill-buffer)
(global-set-key [(control \1)] 'delete-other-windows)
(global-set-key [(control \2)] 'split-window-below)
(global-set-key [(control \3)] 'split-window-right)
(global-set-key [C-tab] 'other-window)
(global-set-key [M-tab] 'other-window)
(global-set-key [f7] 'smart-compile)

(define-key lisp-mode-map [C-c C-e] 'eval-region) ;;???????

;;By super-charging Emacs's completion engine and improving the speed at which you open files and buffers
;;See here: http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-file-extensions-order '(".py" ".cpp" ".h" ".c" ".el" ".cc" ".json" ".js"))

;; Open Next Line, use 'C-o'
(require 'open-next-line)

;; Another stab at making braces and quotes pair like in
;; TextMate:
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers
  
;;启用ibuffer支持，增强*buffer*  
(require 'ibuffer)  
(global-set-key (kbd "C-x C-b") 'ibuffer)  

;;默认进入text-mode，而不是没有什么功能的fundamental-mode  
(setq-default major-mode 'text-mode)  
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;;显示行号  line number
(require 'linum+)
(global-linum-mode 1)  

;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;;设定语言环境为utf-8  
(setq current-language-environment "utf-8")  
;(setq default-input-method "chinese-py")  
(setq locale-coding-system 'utf-8)  
(set-terminal-coding-system 'utf-8)  
(set-keyboard-coding-system 'utf-8)  
(set-selection-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)

(require 'info-look)
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

;;如果你想保存上次打开的文件记录，那么可以使用 desktop。这是 Emacs 自 带的。你只需要加入以上设置，然后 M-x desktop-save。以后 Emacs 启动时就会打开你上次离开时的所有 buffer.M-x desktop-clear 可以删除记住的内容，你闲现在记住的 buffer 太多就可以采用这个办法。不过我还是建议用 ibuffer(见下) 来管理这些buffer，因为有时你会发现，如果删掉全部记住的buffer， 以后你需要一定的时间来打开你经常编辑的文件！
;; (load "desktop") 
;; (desktop-save-mode) 
;; (desktop-read)

;;======================================================================
;;状态栏
;;======================================================================
;;显示时间
;;(display-time)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
;;(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;;显示标题栏 %f 缓冲区完整路径 %p 页面百分数 %l 行号
(setq frame-title-format "%f")

;;=======================================================================
;;缓冲区
;;=====================================================================
;;设定行距
(setq default-line-spaceing 4)
;;页宽
(setq-default fill-column 60)
;;缺省模式 text-mode
;;(setq default-major-mode 'text-mode)
;;设置删除记录
(setq kill-ring-max 200)
;;以空行结束
(setq require-final-newline t)
;;开启语法高亮。
;;(global-font-lock-mode 1)
;;高亮显示区域选择
;;(transient-mark-mode t)
;;页面平滑滚动,scroll-margin 3 靠近屏幕边沿3行开始滚动，正好可以看到上下文
;;(setq scroll-margin 3 scroll-consrvatively 10000)
;;高亮显示成对括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)	
;;鼠标指针避光标
;; (mouse-avoidance-mode 'animate)
;;粘贴于光标处,而不是鼠标指针处
;; (setq mouse-yank-at-point t)	
;;=======================================================================
;;回显区
;;=======================================================================
;;闪屏报警
;;(setq visible-bell t)
;;使用y or n提问
(fset 'yes-or-no-p 'y-or-n-p)
;;锁定行高
(setq resize-mini-windows nil)
;;递归minibuffer
(setq enable-recursive-minibuffers t)
;;当使用M-x COMMAND后，过1秒显示该COMMAND绑定的键
(setq suggest-key-bindings-1)   ;;默认？

;;======================================================================
;;编辑器的设定
;;======================================================================
;;不产生备份文件
;; (setq make-backup-files nil)
;; ;;不生成临时文件
;; (setq-default make-backup-files nil)
;;只渲染当前屏幕语法高亮，加快显示速度
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)

;;使用X剪贴板
(setq x-select-enable-clipboard t)
;;设定剪贴板的内容格式 适应Firefox
(set-clipboard-coding-system 'ctext)

;;以下设置缩进
;;用tab缩进
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;;(setq indent-tabs-mode nil)
;;(setq standard-indent 4)
;;使用空格缩进，不用tab缩进可以避免很多错误
;;(setq indent-tabs-mode nil)
;;(setq tab-always-indent nil)
;;(setq tab-width 4)
;;(setq-default indent-tabs-mode nil)
;;(setq default-tab-width 8)
;;(setq tab-stop-list())
;;(loop for x downfrom 40 to 1 do
;; (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;;设置默认工作目录
;; (setq default-directory "~/")


(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;;===============================================================
;;外观设置
;;===============================================================
;; 去掉滚动条
;; (set-scroll-bar-mode nil)
;;关闭开启画面
(setq inhibit-startup-message t)
;;禁用工具栏
(tool-bar-mode -1)
;;禁用菜单栏
;;(menu-bar-mode nil)

;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;使用鼠标中键可以粘贴
(setq mouse-yank-at-point t)

;;Non-nil if Transient-Mark mode is enabled.
(setq-default transient-mark-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 当浏览 man page 时，直接跳转到 man buffer。
(setq Man-notify-method 'pushy)

;;使用了这个扩展之后，你上次离开 Emacs 时的全局变量 (kill-ring，命令记录……)，局部变量，寄存器，打开的文件，修 改过的文件和最后修改的位置，…… 全部都会被记录下来。加载了 session 之后菜单上会多两项：最近访问过的文件和最近 修改过的文件
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chenyang")


