;; uncomment to run profiler in init.el
;; (profiler-start 'cpu)

;; add theme to path
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'catppuccin t)

;; The following is used to install missing packages.
;; Uncomment to install


;; ;; list the repositories containing them
;; (setq package-archives '(("elpa" . "http://tromey.com/elpa/")
;;                          ("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("gnu-devel" . "http://elpa.gnu.org/devel/")
;;                          ("org" . "https://orgmode.org/elpa/")
;;                          ("melpa" . "https://melpa.org/packages/")
;;                          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; ;; activate all the packages (in particular autoloads)
;; ;; seems like package-instailize is no longer needed after emacs 27
;; ;; (package-initialize)

;; ;; list the packages you want
;; (setq package-list '(xclip company eglot markdown-mode ox-hugo eat))

;; ;;fetch the list of packages available
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ;; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (condition-case nil
;;         (package-install package)
;;       (error  ;; If package isn't found, refresh and try again
;;        (package-refresh-contents)
;;        (package-install package)))))

;; Change fonts

;; (set-face-attribute 'default nil :font "Fira Code-14")
(set-face-attribute 'default nil :font "JetBrains Mono-13")

;; Change font size to 14pt
;; (set-face-attribute 'default nil :height 140)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(eat quelpa company eglot xclip))
 '(tool-bar-mode nil)
 '(warning-suppress-types '((emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:family "JetBrains Mono" :height 1.3))))
 '(org-level-2 ((t (:family "JetBrains Mono" :height 1.2))))
 '(org-level-3 ((t (:family "JetBrains Mono" :height 1.15))))
 '(org-level-4 ((t (:family "JetBrains Mono" :height 1.1))))
 '(org-level-5 ((t (:family "JetBrains Mono" :height 1.05))))
 '(org-level-6 ((t (:family "JetBrains Mono" :height 1.0))))
 '(org-level-7 ((t (:family "JetBrains Mono" :height 1.0))))
 '(org-level-8 ((t (:family "JetBrains Mono" :height 1.0))))
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
;; (setq initial-frame-alist '((width . 88) (height . 40)))  ; Set size of the first window
;; (setq default-frame-alist '((width . 88) (height . 40)))  ; Set size for all subsequent windows

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


;; enable upcase-region
(put 'upcase-region 'disabled nil)


;; load highlight-indent-guides.el and enable by default
(load "~/.emacs.d/highlight-indent-guides.el")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-suppress-auto-error t)
(require 'highlight-indent-guides)


;; load rainbow-delimiters.el
(load "~/.emacs.d/rainbow-delimiters.el")
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)

;; ox-hugo related configs:

;; in order to get export options
(with-eval-after-load 'ox
  (require 'ox-hugo))

;; auto-export on save with ox-hugo
(defun my/org-hugo-export-on-save ()
  (when (derived-mode-p 'org-mode)
    (org-hugo-export-wim-to-md)))

(add-hook 'after-save-hook 'my/org-hugo-export-on-save)


;; enable copy and paste to clipboard in emacs nw
;; Remember to install xclip for this
(xclip-mode 1)

;; Remember to install eglot for this

;;
;; Org mode
;;

(setq org-ellipsis " ▼")    ;; change the ... behavior for headings
(setq org-hide-emphasis-markers t) ;; Hide the emphasis markers
(setq org-pretty-entities t) ;; enable rendering of special symbols
(setq org-image-actual-width nil) ;; allow change image width
(setq org-startup-folded t)  ;; fold all headers when starting
;; (setq org-startup-with-latex-preview t) ;; startup with latex preview
(setq org-use-sub-superscripts '{}) ;; doesn't allow rendering with a_b or a^b but must with a_{b} and a^{b}

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

;; change behavior of different text emphasis
(setq org-emphasis-alist
  '(("*" (bold :foreground "black" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "yellow" :foreground "black"))
    ("+" (:strike-through t))))


(with-eval-after-load 'org
  ;; Change color for all heading levels
  (set-face-foreground 'org-level-1 "royalblue3")
  (set-face-foreground 'org-level-2 "royalblue2")
  (set-face-foreground 'org-level-3 "royalblue1")
  (set-face-foreground 'org-level-4 "dodgerblue3")
  (set-face-foreground 'org-level-5 "dodgerblue2")
  (set-face-foreground 'org-level-6 "dodgerblue1")
  (set-face-foreground 'org-level-7 "deepskyblue2")
  (set-face-foreground 'org-level-8 "deepskyblue1")
)


;; Allow temporarily showing pretty-entities, emphasis markers, and etc
;; when cursor is near them
(load "~/.emacs.d/org-appear.el")
(require 'org-appear)
(add-hook 'org-mode-hook (lambda () (org-appear-mode 1)))
;; By default only emphasis markers are toggled, now enable other
(setq org-appear-autoemphasis t) ;; enable toggling of emphasis markers
(setq org-appear-autosubmarkers t) ;; enable toggling of subscript and superscript markers
(setq org-appear-autoentities t) ;; enable toggling of pretty-entities rendering
(setq org-appear-autolinks t) ;; enable toggling of links
(setq org-appear-inside-latex t) ;; enable toggling inside latex fragments


;; Change different bullets
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
(setq org-format_latex-options  (plist-put org-format-latex-options :scale 2.0))


;;;; emacs-eat setting

;; default to eat-char-mode when using eat.
;; This is full-terminal emulation mode
(with-eval-after-load 'eat
  (add-hook 'eat-exec-hook
            (lambda (_) (eat-char-mode))))



;; uncomment to run profiler in init.el
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (profiler-report)
;;             (profiler-stop)))
