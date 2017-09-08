;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '("~/.spacemacs-layers/")
   dotspacemacs-configuration-layers
   '(
     ocaml
     idris
     go
     yaml
     agda
     auto-completion
     better-defaults
     coq
     emacs-lisp
     git
     git
     github
     haskell
     helm
     html
     javascript
     markdown
     nixos
     purescript
     react
     rust
     scala
     sml
     syntax-checking
     )
   dotspacemacs-additional-packages '(
                                      (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   ;; dotspacemacs-startup-banner 998
   dotspacemacs-startup-banner "~/.spacemacs-layers/1964brassau01.png"
   dotspacemacs-startup-lists '((recents . 5) (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-themes '(spacemacs-light spacemacs-dark)
   dotspacemacs-default-font '("Hack" :size 12 :weight normal :width normal :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key ":"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   evil-escape-key-sequence "jk"
   js-indent-level 2
   js2-basic-offset 2
   web-mode-code-indent-offset 2
   web-mode-indent-style 2
   web-mode-markup-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-css-indent-offset 2
   css-indent-offset 2
   standard-indent 2
   x-select-enable-clipboard t
   create-lockfiles nil
   tab-width 2
   ))

(defun dotspacemacs/user-config ()
  (push '("\\.js\\'" . react-mode) auto-mode-alist)
  (evil-ex-define-cmd "W" 'evil-write)
  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)
  (setq browse-url-generic-program "google-chrome-stable")
  (setq tab-width 2)
  (setq vc-follow-symlinks t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (idris-mode prop-menu go-guru go-eldoc company-go go-mode hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc company-cabal cmm-mode caml purescript-mode sml-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode haskell-mode haml-mode gh marshal logito pcache ht sbt-mode scala-mode web-completion-data dash-functional tern nixos-options company-math math-symbol-lists rust-mode xterm-color shell-pop org multi-term markdown-mode gitignore-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter pos-tip flycheck magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company yasnippet auto-complete wgrep smex ivy-hydra counsel-projectile counsel swiper ivy yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package tuareg toml-mode toc-org tagedit spacemacs-theme spaceline smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters racer quelpa pug-mode psci psc-ide popwin persp-mode pcre2el paradox orgit org-plus-contrib org-bullets open-junk-file ocp-indent ob-sml noflet nix-mode neotree mwim move-text mmm-mode merlin markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc intero info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-nixos-options helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flycheck-rust flycheck-pos-tip flx-ido floobits fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view ensime emmet-mode elisp-slime-nav dumb-jump define-word company-web company-tern company-statistics company-nixos-options company-coq column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu cargo auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
