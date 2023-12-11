;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;;
;;;full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setf (cdr (assq 'truncation fringe-indicator-alist)) '(nil nil))
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jing Huang"
      user-mail-address "eatgrass@live.cn")

;; (setq window-divider-default-places 'bottom-only
;;       window-divider-default-bottom-width 0
;;       window-divider-default-right-width 0)
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font                   (font-spec :family "Operator Mono X" :size 14)
      doom-big-font               (font-spec :family "BerkeleyMonoVariable Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "BerkeleyMonoVariable Nerd Font Mono" :size 14)
      git-gutter:modified-sign "▎"
      git-gutter:added-sign "▎"    ;; multiple character is OK
      git-gutter:deleted-sign "▎"
      default-text-properties '(line-spacing 0.3 line-height 1.3)
      )


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; remove treemacs bg border
(defun treemacs_bg ()
  "Remap hl-line face."
  (face-remap-add-relative 'treemacs-window-background-face `(:background ,(face-background 'default) :foreground ,(face-foreground 'lazy-highlight))))
(with-eval-after-load 'treemacs 
  (add-hook 'treemacs-mode-hook #'treemacs_bg))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; (defun set-bigger-spacing ()
;;   (setq-local default-text-properties '(line-spacing 0.3 line-height 1.3)))
;; (add-hook 'text-mode-hook 'set-bigger-spacing)
;; (add-hook 'prog-mode-hook 'set-bigger-spacing)
;; (add-hook 'doc-view-mode-hook 'set-bigger-spacing)
;; (setq-default line-spacing 0.3)
;; (setq-default line-height 1.3)
;; (add-text-properties (point-min) (point-max)
;;                      '(line-spacing 0.25 line-height 1.25))

(add-hook! 'doom-load-theme-hook
  (after! treemacs
    (set-face-attribute 'treemacs-root-face nil :height 1.0 :slant 'italic)
    (set-face-attribute 'treemacs-window-background-face nil :background (face-background 'default) :foreground (face-foreground 'lazy-highlight))
    ))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

