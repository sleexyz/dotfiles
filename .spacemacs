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
     jsx
     javascript
     glsl
     html
     agda
     purescript
     haskell
     '((haskell :variables haskell-enable-hindent-style "johan-tibell")
       (haskell :variables haskell-process-type 'stack-ghci))

     auto-completion
     better-defaults
     markdown
     ess
     git
     github
     syntax-checking
     ;; clojure
     syntax-checking
     )
   dotspacemacs-excluded-packages '(
                                    ;; exec-path-from-shell
                                    )
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner `doge
   dotspacemacs-always-show-changelog nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-themes '(spacemacs-light base16-chalk-dark)
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

(defun dotspacemacs/config ()
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

  (when (configuration-layer/layer-usedp 'haskell)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
    ;; (add-hook 'haskell-interactive-mode-hook 'turn-on-haskell-indentation)
    ;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
    (add-hook 'haskell-mode-hook (lambda ()
                                   (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
                                     "ht"  'ghc-show-type
                                     "hi"  'ghc-show-info))))
    ;; (add-hook 'haskell-interactive-mode-hook
    ;;           (lambda ()
    ;;             (setq-local evil-move-cursor-back nil)))
    ;; (when (configuration-layer/layer-usedp 'haskell)
    ;;   (defadvice haskell-interactive-switch (after spacemacs/haskell-interactive-switch-advice activate)
    ;;     (when (eq dotspacemacs-editing-style 'vim)
    ;;       (call-interactively 'evil-insert)))))

  (setq tab-width 2)
  (setq c-basic-offset 2))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(js-indent-level 2)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
