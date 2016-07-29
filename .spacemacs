;; -*- mode: dotspacemacs -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; languages
     nixos
     rust
     emacs-lisp
     react
     scala
     javascript
     glsl
     html
     agda
     purescript
     sml
     ;;coq
     intero
     ;; haskell
     ;; '((haskell :variables haskell-enable-hindent-style "johan-tibell")
     ;;   (haskell :variables haskell-process-type 'stack-ghci))

     auto-completion
     better-defaults
     markdown
     ess
     git
     github
     clojure
     syntax-checking
     )
   dotspacemacs-excluded-packages '(
                                    ;; exec-path-from-shell
                                    )
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https nil
   dotspacemacs-check-for-update nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner `doge
   dotspacemacs-always-show-changelog nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   ;; dotspacemacs-themes '(spacemacs-light base16-chalk-dark)
   ;; dotspacemacs-themes '(trans transdark2)
   dotspacemacs-themes '(trans transdark2)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               ;; :antialias nil
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-guide-key-delay 0.4
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 100
   dotspacemacs-inactive-transparency 100
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here

  (setq-default evil-escape-key-sequence "jk")
  )

(defun poopy()
  (interactive)
  (hidden-mode-line-mode)
  (set-face-background 'default "unspecified-bg" (selected-frame))
  )

(defun dotspacemacs/config ()
  (evil-ex-define-cmd "W" 'evil-write)
  (global-set-key (kbd "<C-mouse-4>") 'zoom-frm-in)
  (global-set-key (kbd "<C-mouse-5>") 'zoom-frm-out)
  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)
  (setq vc-follow-symlinks t)
  (setq browse-url-generic-program "google-chrome-stable")
  (setq browse-url-browser-function 'browse-url-generic)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq default-input-method 'TeX)
  (setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")


  (defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
      (poopy)
      (add-hook 'after-change-major-mode-hook hidden-mode-line-mode)))

  (add-hook 'window-setup-hook 'on-after-init)

  (when (configuration-layer/layer-usedp 'haskell)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
    (add-hook 'haskell-interactive-mode-hook 'turn-on-haskell-indentation)
    (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
    (add-hook 'haskell-mode-hook (lambda ()
                                   (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
                                     "ht"  'ghc-show-type
                                     "hi"  'ghc-show-info)))
    (add-hook 'haskell-interactive-mode-hook
              (lambda ()
                (setq-local evil-move-cursor-back nil)))
    (when (configuration-layer/layer-usedp 'haskell)
      (defadvice haskell-interactive-switch (after spacemacs/haskell-interactive-switch-advice activate)
        (when (eq dotspacemacs-editing-style 'vim)
          (call-interactively 'evil-insert)))))

  (setq tab-width 2)
  (setq c-basic-offset 2))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(ansi-term-color-vector
   [unspecified "#151515" "#fb9fb1" "#acc267" "#ddb26f" "#6fc2ef" "#e1a3ee" "#6fc2ef" "#d0d0d0"])
 '(custom-safe-themes
   (quote
    ("f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cd1a1bb051e753a8fd65ed202632e0013705348f6add0ce18fccc91e2978ed24" "d4f50eee86290b221fcddf6455888d7457a367267a06bb2cf40af0370c80618a" "70b9c3d480948a3d007978b29e31d6ab9d7e259105d558c41f8b9532c13219aa" "1a97f5e224ae61f27b2e85613c4024f555cd4dffd607f7d6c999c67028671d4d" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(hl-sexp-background-color "#efebe9")
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (noflet ensime sbt-mode scala-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toml-mode tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters racer quelpa psci psc-ide popwin persp-mode pcre2el paradox page-break-lines orgit open-junk-file ob-sml nix-mode neotree move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode intero info+ indent-guide ido-vertical-mode hungry-delete hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-nixos-options helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flycheck-rust flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view emmet-mode elisp-slime-nav define-word company-web company-tern company-statistics company-racer company-quickhelp company-nixos-options coffee-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(ring-bell-function (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
