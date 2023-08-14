;; UI STUFF ;;
(setq inhibit-startup-message t) ;; remove startup message
(scroll-bar-mode -1) ;; remove scroll bar
(tool-bar-mode -1) ;; remove tool bar
(tooltip-mode -1) ;; remove tool tips
(menu-bar-mode -1) ;; remove menu bar
(set-fringe-mode 10) ;; Paddings
(global-display-line-numbers-mode t) ;; line numbers

;; FONT ;;
(set-face-attribute 'default nil :font "IosevkaTerm Nerd Font" :height 200)

;; THEMING ;;
(load-theme 'wombat)

;; PACKAGE MANAGER ;;
(require 'package)

; set repositories
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
; check if repositories are already on machine
(unless package-archive-contents
 (package-refresh-contents))

; install use-package if not already done
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ; make sure all packages will be installed

;; PACKAGES ;;
(use-package doom-modeline
             :ensure t
             :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
             :hook (prog-mode .rainbow-delimiters-mode))

(use-package which-key
             :init (which-key-mode)
             :diminish which-key-mode
             :config
             (setq which-key-idle-delay 0.3))
