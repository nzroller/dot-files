;;;; CUSTOM

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

;;;; Swedish Keyboard and copy stuff

;; http://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
;; I prefer using the "clipboard" selection (the one the
;; typically is used by c-c/c-v) before the primary selection
;; (that uses mouse-select/middle-button-click)
;; (setq x-select-enable-clipboard t)

;; after copy Ctrl+c in X11 apps, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)


;; Callback for when user cuts
(unless window-system
(when (getenv "DISPLAY")
(defun xsel-cut-function (text &optional push)
;;Insert text to temp-buffer, and "send" content to xsel stdin
    (with-temp-buffer
     (insert text)
     ;; I prefer using the "clipboard" selection (the one the
     ;; typically is used by c-c/c-v) before the primary selection
     ;; (that uses mouse-select/middle-button-click)
     (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
 ;; Call back for when user pastes
 (defun xsel-paste-function()
    ;; Find out what is current selection by xsel. If it is different
    ;; from the top of the kill-ring (car kill-ring), then return
    ;; it. Else, nil is returned, so whatever is in the top of the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
     (unless (string= (car kill-ring) xsel-output)
   xsel-output )))
 ;; Attach callbacks to hooks
 (setq interprogram-cut-function 'xsel-cut-function)
 (setq interprogram-paste-function 'xsel-paste-function)
 ;; Idea from
 ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
 ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
))

;;;; Swedish keyboard

;; dabbrev-expand är en mycket användbar funktion som försöker
;; fullborda ett ofullständigt ord. Då behöver man bara skriva de
;; första tecknen av ett långt variabelnamn och därefter använda
;; dabbrev-expand. Funktionen finns redan som M-/ men det ligger så
;; knöligt på svenska tangentbord, så vi lägger till M-< som
;; snabbtangent.
(global-set-key "\M-<" 'hippie-expand)

;;;; INITIAL
(setq ns-use-srgb-colorspace t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; chill Winston
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;;;; PACKAGES
;; (if (fboundp 'gnutls-available-p)
;;     (fmakunbound 'gnutls-available-p))
;; (setq tls-program '("gnutls-cli --tofu -p %p %h")
;;       imap-ssl-program '("gnutls-cli --tofu -p %p %s")
;;       smtpmail-stream-type 'starttls
;;       starttls-extra-arguments '("--tofu")
;;       )
(require 'package)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("milkbox" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(require 'cl)
(defvar prelude-packages '(
                           ace-jump-mode
                           ag
                           ansible
                           anzu
                           auto-package-update
                           autopair
                           better-defaults
                           company
                           company-go
                           company-ghc
                           company-inf-ruby
                           dockerfile-mode
                           editorconfig
                           enh-ruby-mode
                           exec-path-from-shell
                           expand-region
                           fic-mode
                           flx-ido
                           flatland-theme
                           flycheck
                           flycheck-color-mode-line
                           flycheck-haskell
                           flycheck-rust
                           flyspell-lazy
                           ghc
                           gist
                           git-timemachine
                           go-direx
                           go-eldoc
                           go-mode
                           go-snippets
                           groovy-mode
                           haskell-mode
                           hi2
                           highlight-symbol
                           hindent
                           ido-vertical-mode
                           idomenu
                           imenu-anywhere
                           inf-ruby
                           ir-black-theme
                           js2-mode
                           json-mode
                           magit
                           markdown-mode
                           org-plus-contrib
                           paredit
                           popwin
                           processing-mode
                           projectile
                           puppet-mode
                           rainbow-delimiters
                           rust-mode
                           scala-mode
                           shm
                           smart-mode-line
                           smex
                           smooth-scrolling
                           toml-mode
                           terraform-mode
                           undo-tree
                           web-mode
                           yaml-mode
                           yasnippet
                           zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; don't re-load packages
(setq package-enable-at-startup nil)

;;;; GLOBAL

;; use smart-mode-line
(setq rm-excluded-modes (quote (" WS"
                               " FIC"
                               " pair"
                               " ElDoc"
                               " yas"
                               " Projectile"
                               " MRev"
                               " company"
                               " Fly"
                               " GitGutter"
                               " Paredit"
                               " Undo-Tree"
                               " Anzu"
                               " hl-s"
                               " VHl"
                               " Abbrev")))
(setq sml/theme 'respectful)
(sml/setup)

(load-theme 'flatland t)
;; (load-theme 'zenburn t)

;; it's cool if yasnippet doesn't say everything it's thinking
(require 'yasnippet)
(setq yas-verbosity 1)
(yas-global-mode)

;; show total matches in modeline
(global-anzu-mode t)

;; highlight current symbol in prog-mode
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(setq highlight-symbol-on-navigation-p t)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)

;; use autopair everywhere
(autopair-global-mode t)

;; rely on electric indents, since they're improving
(electric-indent-mode t)

;; add volatile highlights to edit actions
;(require 'volatile-highlights)
;(volatile-highlights-mode t)

;; use whitespace mode, and mark lines longer than 80 characters
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face empty lines-tail trailing))
(setq whitespace-line-column 80)
(setq whitespace-global-modes '(not git-commit-mode))

;; also fill paragraphs to 80 characters
(setq-default fill-column 80)

;; add context menus for things
;; (global-discover-mode f)

;; use line numbers in prog-mode
(add-hook 'prog-mode-hook 'linum-mode)

;; highlight the current line
(global-hl-line-mode)

;; highlight fixme comments
(add-hook 'prog-mode-hook 'fic-mode)

;; always use ElDoc in prog-mode
(add-hook 'prog-mode-hook 'eldoc-mode)

;; overwrite selections
(delete-selection-mode t)

;; use projectile everywhere
(projectile-global-mode t)

;; group ibuffer by vc root
(add-hook 'ibuffer-hook 'ibuffer-vc-set-filter-groups-by-vc-root)

;; enable flycheck everywhere
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

;; a tab is 4 spaces wide
(setq-default tab-width 4)

;; don't show the welcome message
(setq inhibit-splash-screen t)

;; shut up shut up shut up
(setq ring-bell-function 'ignore)

;; always delete trailing whitespace
;;(remove-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use core-utils for dired
;;
(setq insert-directory-program "ls")

;; always prefer UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; always add a trailing newline - POSIX
(setq require-final-newline t)

;; no need to be so verbose
(defalias 'yes-or-no-p 'y-or-n-p)

;; use undo-tree
(global-undo-tree-mode)

;; bind windmove to super-arrows
(windmove-default-keybindings 'super)

;; enable rainbow delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;; C/C++

(add-hook 'c-mode-hook 'cppcm-reload-all)
(add-hook 'c++-mode-hook 'cppcm-reload-all)

;;;; IDO

;; use flx-ido
(flx-ido-mode t)

;; use ido vertically
(ido-vertical-mode t)

;; don't complete on extensions with ido
(setq ido-ignore-extensions t)

;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;; autoload idomenu
(autoload 'idomenu "idomenu" nil t)
;; autoload jump-mode
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)

;;;; ELISP

;; surface Elisp sections in imenu
(defun coda/imenu-elisp-sections ()
  (setq imenu-generic-expression '(("Sections" "^;;;; \\(.+\\)" 1)))
  (imenu-add-to-menubar "Index"))
(add-hook 'emacs-lisp-mode-hook 'coda/imenu-elisp-sections)

;; use paredit
(add-hook 'lisp-mode-hook 'paredit-mode)

;;;; COCOA

(defun coda/configure-cocoa ()
  ;; load PATH variable from shell, since setting env bars in Emacs
  ;; is crazy painful
  (exec-path-from-shell-initialize)

  ;; open up maximized-ish
  (let ((px (display-pixel-width))
        (py (display-pixel-height))
        (fx (frame-char-width))
        (fy (frame-char-height))
        tx ty)
    (setq tx (- (/ px fx) 7))
    (setq ty (- (/ py fy) 4))
    (setq initial-frame-alist '((top . 2) (left . 2)))
    (add-to-list 'default-frame-alist (cons 'width tx))
    (add-to-list 'default-frame-alist (cons 'height ty)))

  ;; don't scroll like a maniac
  (setq mouse-wheel-scroll-amount '(1))
  (setq mouse-wheel-progressive-speed nil)
)
(if (memq window-system '(mac ns)) (coda/configure-cocoa))

;;;; COMPANY

(require 'company)

;; use a bigger popup window
(setq company-tooltip-limit 20)

;; only auto-complete on key binding
(setq company-idle-delay nil)

;; take over hippie-expand
(defun coda/enable-company-mode ()
  (company-mode 1)
  (define-key (current-local-map) [remap hippie-expand] 'company-complete))
(add-hook 'prog-mode-hook 'coda/enable-company-mode)

;; strictly limit completion in Go, since it's totally accurate
(defadvice company-go (around fix-company-go-prefix activate)
      ad-do-it
      (when (eql (ad-get-arg 0) 'prefix)
        (setq ad-return-value (company-grab-word))))

;;;; SPELLING

(require 'ispell)

;; use aspell instead of ispell
(setq ispell-program-name "aspell")

;; automatically check spelling for text
(add-hook 'text-mode-hook 'flyspell-mode)

;; spell check comments and strings when programming
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; spell check git commit messages
(add-hook 'git-commit-mode-hook 'flyspell-mode)

;;;; TERMINAL

(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(defun coda/visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term "/bin/bash"))
    (switch-to-buffer-other-window "*ansi-term*")))

(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

;;;; GO

;; hard-code GOROOT and GOPATH for now
(setenv "GOROOT" "/opt/go")
(setenv "GOPATH" "/home/tim/src/go")

(require 'go-mode)

;;(add-to-list 'load-path "~/src/go/src/github.com/dougm/goflymake")
;; (eval-after-load "go-mode"
;;  '(require 'go-flycheck))

;; use goimports instead of gofmt
(setq gofmt-command "goimports")

;; always run goimports before saving .go files
(add-hook 'before-save-hook 'gofmt-before-save)

(defun tim/configure-go-mode ()
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test --coverprofile cover.out -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)

  ;; use go-eldoc
  (go-eldoc-setup)

  ;; only use gocode as company backend
  (set (make-local-variable 'company-backends) '(company-go)))

(add-hook 'go-mode-hook 'tim/configure-go-mode)

;;;; DIREX

(require 'popwin)
(popwin-mode 1)

(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-c l d") 'direx:jump-to-directory-other-window)

(push '("^\*go-direx:" :regexp t :position left :width 0.4 :dedicated t)
      popwin:special-display-config)
(define-key go-mode-map (kbd "C-c l g") 'go-direx-pop-to-buffer)

;;;; MAGIT

;; highlight git changes in the fringe
;; (require 'git-gutter-fringe)
;; (global-git-gutter-mode t)

(require 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;;;; JAVASCRIPT

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;;; KEYBINDINGS
(global-set-key (kbd "C-c c")       'compile)
(global-set-key (kbd "C-c g")       'magit-status)
(global-set-key (kbd "C-c h n")     'git-gutter:next-hunk)
(global-set-key (kbd "C-c h p")     'git-gutter:previous-hunk)
(global-set-key (kbd "C-c h r")     'git-gutter:revert-hunk)
(global-set-key (kbd "C-c i")       'idomenu)
(global-set-key (kbd "C-c l p")     'list-packages)
(global-set-key (kbd "C-c r")       'recompile)
(global-set-key (kbd "C-c t")       'coda/visit-term-buffer)
(global-set-key (kbd "C-c +")       'er/expand-region)
(global-set-key (kbd "C-c -")       'er/contract-region)
(global-set-key (kbd "C-c SPC")     'ace-jump-mode)

(global-set-key (kbd "C-c M-x")     'execute-extended-command) ; old M-x

(global-set-key (kbd "M-x")         'smex)
(global-set-key (kbd "M-X")         'smex-major-mode-commands)

(global-set-key (kbd "C-c C-c e") 'mc/edit-lines)
(global-set-key (kbd "C-c >")         'mc/mark-next-like-this)
(global-set-key (kbd "C-c <")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-c <")     'mc/mark-all-like-this)

(defun coda/join-lines ()
  (interactive)
  (join-line -1))
(global-set-key (kbd "C-M-j")         'coda/join-lines)

(defun coda/move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(global-set-key (kbd "<C-S-down>")  'coda/move-line-down)

(defun coda/move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
(global-set-key (kbd "<C-S-up>")    'coda/move-line-up)

;; unmap upcase-region, since it always screws with undo
(global-unset-key (kbd "C-x C-u"))

(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

;; emacsclient ignore "still has clients" on kill buffer

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;(load "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
;;(add-hook 'go-mode-hook 'go-oracle-mode)

(require 'recentf)

(recentf-mode 1)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(setq magit-last-seen-setup-instructions "1.4.0")

;; org-expiry too
(require 'org-expiry)
(org-expiry-insinuate)
(setq org-expiry-inactive-timestamps t)

(load "editorconfig")
(editorconfig-mode 1)
(provide 'init)
;;;

;; Allow automatically handing of created/expired meta data.
(require 'org-expiry)
;; Configure it a bit to my liking
(setq
  org-expiry-created-property-name "CREATED" ; Name of property when an item is created
  org-expiry-inactive-timestamps   t         ; Don't have everything in the agenda view
)

(defun mrb/insert-created-timestamp()
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (org-expiry-insert-created)
  (org-back-to-heading)
  (org-end-of-line)
  (insert " ")
)

;; Whenever a TODO entry is created, I want a timestamp
;; Advice org-insert-todo-heading to insert a created timestamp using org-expiry
(defadvice org-insert-todo-heading (after mrb/created-timestamp-advice activate)
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (mrb/insert-created-timestamp)
)
;; Make it active
(ad-activate 'org-insert-todo-heading)


;;;  Jonas.Jarnestrom<at>ki.ericsson.se A smarter
;;;  find-tag that automagically reruns etags when it cant find a
;;;  requested item and then makes a new try to locate it.
;;;  Fri Mar 15 09:52:14 2002

(defadvice find-tag (around refresh-etags activate)
 "Rerun etags and reload tags if tag not found and redo find-tag.
 If buffer is modified, ask about save before running etags."
(let ((extension (file-name-extension (buffer-file-name))))
  (condition-case err
  ad-do-it
    (error (and (buffer-modified-p)
        (not (ding))
        (y-or-n-p "Buffer is modified, save it? ")
        (save-buffer))
       (er-refresh-etags extension)
       ad-do-it))))

(defun er-refresh-etags (&optional extension)
"Run etags on all peer files in current dir and reload them silently."
(interactive)
(shell-command (format "etags *.%s" (or extension "el")))
(let ((tags-revert-without-query t))  ; don't query, revert silently
  (visit-tags-table default-directory nil)))


(defconst modi/linum-mode-hooks '(verilog-mode-hook
                                  emacs-lisp-mode-hook
                                  cperl-mode-hook
                                  c-mode-hook
                                  python-mode-hook
                                  matlab-mode-hook
                                  sh-mode-hook
                                  web-mode-hook
                                  html-mode-hook
                                  css-mode-hook
                                  makefile-gmake-mode-hook
                                  tcl-mode-hook)
  "List of hooks of major modes in which a linum mode should be enabled.")
(when global-linum-mode
      (global-linum-mode -1))
(dolist (hook modi/linum-mode-hooks)
      (add-hook hook #'linum-mode))

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command
      (format "find %s -type f -name \"*.java\" | etags -" dir-name)))
