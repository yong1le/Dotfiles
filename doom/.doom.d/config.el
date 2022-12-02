;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; General Client Settings
(setq user-full-name "Yong Le"
      user-mail-address "yonggoy912@gmail.com")
(setq org-directory "~/Documents/Org/")
(setq org-roam-directory "~/Documents/Org/")

;; Theme
(setq doom-theme 'doom-gruvbox)
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 15 :weight 'medium))
(setq display-line-numbers-type 'relative)
(setq scroll-margin 20)

;;GUI
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(define-key global-map [menu-bar options] nil)
(define-key global-map [menu-bar help-menu] nil)
(define-key global-map [menu-bar file] nil)
(define-key global-map [menu-bar edit] nil)

;; General Options
(setq confirm-kill-emacs nil)
(desktop-save-mode 1)

;;; Keybindings
;; (global-set-key (kbd "C-e") 'emmet-expand-line)
;; Window Moving
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
;; Tab moving
(evil-define-key 'normal centaur-tabs-mode-map (kbd "C-<tab>") 'centaur-tabs-forward
                                               (kbd "C-S-<tab>")  'centaur-tabs-backward
                                               (kbd "g j")  'centaur-tabs-forward-group
                                               (kbd "g k")    'centaur-tabs-backward-group)

(map! :leader :desc "NeoTree" "e" 'neotree-toggle) ;; Toggle Neotree
(map! :leader :desc "Comment Line" "/" 'comment-line) ;; Toggle Neotree
(map! "C-`" :desc "Terminal" #'+vterm/toggle) ;; Toggle Vterm


;;; EXTENSION SETTINGS
;; Neotree
(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(setq neo-theme 'icons)
;; emmet
;; (add-to-list 'load-path "~/emacs.d/emmet-mode")
;; (require 'emmet-mode)
