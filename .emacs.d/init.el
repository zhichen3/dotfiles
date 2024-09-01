;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'catppuccin t)

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("gnu-devel" . "http://elpa.gnu.org/devel/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))


; list the packages you want
(setq package-list '(xclip company eglot))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(company eglot xclip))
 '(tool-bar-mode nil)
 '(warning-suppress-types '((emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:family "Fira Code" :height 1.3))))
 '(org-level-2 ((t (:family "Fira Code" :height 1.2))))
 '(org-level-3 ((t (:family "Fira Code" :height 1.15))))
 '(org-level-4 ((t (:family "Fira Code" :height 1.1))))
 '(org-level-5 ((t (:family "Fira Code" :height 1.05))))
 '(org-level-6 ((t (:family "Fira Code" :height 1.0))))
 '(org-level-7 ((t (:family "Fira Code" :height 1.0))))
 '(org-level-8 ((t (:family "Fira Code" :height 1.0)))))


(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (setq column-number-mode t))

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

;; Disable global whitespace mode
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
          (newline-mark 10 [8617 10]) ; LINE FEED, 8629
          (tab-mark 9 [8677 9] [92 9]) ; tab
          )
        )
  )

;; Change whitespace face colors
(custom-set-faces
 '(whitespace-space ((t (:background "##FFFFFF" :foreground "#BABDB6"))))
 '(whitespace-tab ((t (:background "##FFFFFF" :foreground "#FF6C6B"))))
 '(whitespace-newline ((t (:background "##FFFFFF" :foreground "#BABDB6"))))
 '(whitespace-trailing ((t (:background "##FFFFFF" :foreground "#FF6C6B"))))
 '(whitespace-line ((t (:background "#333333"))))
 ;; '(whitespace-space-after-tab ((t (:background "##FFFFFF" :foreground "#FF6C6B"))))
 ;; '(whitespace-indentation ((t (:background "##FFFFFF" :foreground "#FF6C6B"))))
 ;; '(whitespace-empty ((t (:background "##FFFFFF" :foreground "#FF6C6B"))))
 )

;; enable upcase-region
(put 'upcase-region 'disabled nil)

;; load highlight-indent-guides.el and enable by default
(load "~/.emacs.d/highlight-indent-guides.el")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(require 'highlight-indent-guides)

;; load rainbow-delimiters.el
(load "~/.emacs.d/rainbow-delimiters.el")
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)

;; enable copy and paste to clipboard in emacs nw
;; Remember to install xclip for this
(xclip-mode 1)

;; Remember to install eglot for this



;; Org mode
(setq org-ellipsis " ▼")    ;; change the ... behavior for headings
(setq org-hide-emphasis-markers t) ;; Hide the emphasis markers
(setq org-pretty-entities t) ;; enable rendering of special symbols
(setq org-image-actual-width nil)
(setq org-startup-folded t)  ;; fold all headers when starting
(setq org-startup-with-latex-preview t) ;; startup with latex preview

;; set custom todo keywords
 (setq org-todo-keywords
  '((sequence "TODO"
      "MAYBE"
      "NEXT"
      "IN-PROGRESS"
      "REPORT"
      "|"
      "DONE"
      "DEFERRED"
      "CANCELLED")))

(setq org-todo-keyword-faces
      '(("TODO" . "orange")
        ("MAYBE" . "mistyrose4")
        ("NEXT" . "blueviolet")
        ("IN-PROGRESS" . "beige")
        ("REPORT" . "cyan1")
        ("DONE" .  "mediumspringgreen")
        ("DEFERRED" . "chocolate")
        ("CANCELLED" . "red3"))
 )

(load "~/.emacs.d/org-bullets.el")
(require 'org-bullets) ;; Change the bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; allow visual line mode, auto break long lines of the current buffer
(add-hook 'org-mode-hook 'visual-line-mode)

;; Allow text indentation to follow header
(add-hook 'org-mode-hook 'org-indent-mode)

;; Change hyphens, - to dots
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Change the font size of latex fragment (math) rendering
(require 'org)
(setq org-format_latex-options  (plist-put org-format-latex-options :scale 1.5))
