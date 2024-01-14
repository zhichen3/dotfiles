(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'catppuccin t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages '(eglot xclip))
 '(warning-suppress-types '((emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (not (display-graphic-p))
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (setq column-number-mode t))

;; Set indent to space for c++
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux")
(setq c-basic-offset 4)
(setq c-basic-indent 4)
(c-set-offset 'comment-intro 0)

;; Python mode specific settings
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent-offset 4))
          )

;; Delete trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable global whitespace mode
(global-whitespace-mode 1)

;; Whitespace mode settings
(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://xahlee.info/emacs/emacs/whitespace-mode.html
  ;; (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
  (setq whitespace-display-mappings
        ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
        '(
          (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
          (newline-mark 10 [8629 10]) ; LINE FEED,
          (tab-mark 9 [8677 9] [92 9]) ; tab
          )
        )
  )

;; enable upcase-region
(put 'upcase-region 'disabled nil)

;; load highlight-indent-guides.el and enable by default
(load "~/.emacs.d/highlight-indent-guides.el")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; load rainbow-delimiters.el
(load "~/.emacs.d/rainbow-delimiters.el")
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)

;; enable copy and paste to clipboard in emacs nw
;; Remember to install xclip for this
(xclip-mode 1)

;; Remember to install eglot for this
