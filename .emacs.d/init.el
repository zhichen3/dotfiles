(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'catppuccin t)
;; (load-theme 'zenburn t)

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

;; Change font to Fira Code, size 14

(set-face-attribute 'default nil :font "Fira Code-14")

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
 '(org-level-8 ((t (:family "Fira Code" :height 1.0))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#CC0000"))))
 '(rainbow-delimiters-depth-10-face ((t (:foreground "#4E9A06"))))
 '(rainbow-delimiters-depth-11-face ((t (:foreground "#204A87"))))
 '(rainbow-delimiters-depth-12-face ((t (:foreground "#5C3566"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#F57900"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#73D216"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#3465A4"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#75507B"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EDD400"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#8F5902"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#A40000"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#CE5C00"))))
 '(whitespace-line ((t (:background "#333333"))))
 '(whitespace-newline ((t (:foreground "#BABDB6"))))
 '(whitespace-space ((t (:foreground "#BABDB6"))))
 '(whitespace-tab ((t (:foreground "#FF6C6B"))))
 '(whitespace-trailing ((t (:foreground "#FF6C6B")))))


; Set window size for graphics emacs mode
(setq initial-frame-alist '((width . 99) (height . 40)))  ; Set size of the first window
(setq default-frame-alist '((width . 99) (height . 40)))  ; Set size for all subsequent windows

(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode 1)
  (set-scroll-bar-mode 'right)
  (global-display-line-numbers-mode)
  (which-function-mode)
  (setq column-number-mode t))

(when (not (display-graphic-p))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (xterm-mouse-mode)
  (which-function-mode)
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

;; Enable global whitespace mode
(global-whitespace-mode 1)

;; Change highlight when line is over 80 characters to 200
(setq whitespace-line-column 200)

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

;; Change rainbow-delimiter colors



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
        ("NEXT" . "darkviolet")
        ("IN-PROGRESS" . "gray15")
        ("REPORT" . "sienna4")
        ("DONE" .  "limegreen")
        ("DEFERRED" . "chocolate")
        ("CANCELLED" . "red3"))
 )

(with-eval-after-load 'org
  ;; Change color for all heading levels
  (set-face-foreground 'org-level-1 "midnightblue")
  (set-face-foreground 'org-level-2 "navy")
  (set-face-foreground 'org-level-3 "mediumblue")
  (set-face-foreground 'org-level-4 "blue")
  (set-face-foreground 'org-level-5 "midnightblue")
  (set-face-foreground 'org-level-6 "navy")
  (set-face-foreground 'org-level-7 "mediumblue")
  (set-face-foreground 'org-level-8 "blue")
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
