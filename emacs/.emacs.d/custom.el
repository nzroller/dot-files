(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "b1471d88b39cad028bd621ae7ae1e8e3e3fca2c973f0dfe3fd6658c194a542ff" default)))
 '(fci-rule-color "#383838")
 '(flycheck-flake8-maximum-line-length 100)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(indent-tabs-mode nil)
 '(json-reformat:indent-width 2)
 '(magit-use-overlays nil)
 '(markdown-command "mdpress")
 '(markdown-command-needs-filename t)
 '(nxml-child-indent 4)
 '(org-agenda-file-regexp "\\`[^. ].*\\.org\\'")
 '(org-agenda-files (quote ("~/GTD")))
 '(org-agenda-skip-scheduled-if-done t)
 '(org-capture-templates
   (quote
    (("a" "Add note" entry
      (file+headline org-default-notes-file "Tasks")
      "** %?
   :PROPERTIES:
   :CREATED:  %U
   :END:

   %i
"))))
 '(org-custom-properties (quote ("CREATED")))
 '(org-default-notes-file "~/GTD/Inbox.org")
 '(org-log-done (quote time))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))
 '(org-todo-keywords
   (quote
    ((sequence "NEXT" "WAITING" "|" "DONE" "DELEGATED" "DISCARDED"))))
 '(package-selected-packages
   (quote
    (markdown-mode+ smooth-scroll kotlin-mode solarized-theme helm fzf csv-mode magit-find-file lsp-mode zenburn-theme yaml-mode web-mode undo-tree terraform-mode toml-mode smooth-scrolling smex smart-mode-line shm scala-mode rust-mode rainbow-delimiters puppet-mode projectile processing-mode popwin paredit org-plus-contrib markdown-mode magit json-mode js2-mode ir-black-theme imenu-anywhere idomenu ido-vertical-mode hindent highlight-symbol hi2 groovy-mode go-snippets go-eldoc go-direx git-timemachine gist flyspell-lazy flycheck-rust flycheck-haskell flycheck-color-mode-line flycheck flatland-theme flx-ido fic-mode expand-region exec-path-from-shell enh-ruby-mode editorconfig dockerfile-mode company-inf-ruby company-ghc company-go company better-defaults autopair auto-package-update anzu ansible ag ace-jump-mode)))
 '(safe-local-variable-values (quote ((whitespace-line-column . 60))))
 '(savehist-mode t)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(tab-width 4)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(whitespace-line-column 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(flycheck-fringe-error ((t (:background "dark red" :foreground "#BC8383" :weight bold))))
 '(go-coverage-untracked ((t (:foreground "#505050"))))
 '(region ((t (:background "black" :foreground "white" :inverse-video t)))))
