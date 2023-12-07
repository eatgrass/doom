;; ;; remove divider
;; (set-display-table-slot standard-display-table
;;                         'vertical-border (make-glyph-code 8203))

;; treemacs
;; remove treemacs bg border
;; (defun treemacs_bg ()
;;   "Remap treemacs face."
;;   (face-remap-add-relative 'treemacs-window-background-face `(:background ,(face-background 'default) :foreground ,(face-foreground 'lazy-highlight))))
;; (with-eval-after-load 'treemacs
;;   (add-hook 'treemacs-mode-hook #'treemacs_bg))

;; banner
(defun empty-string ()
  "")
(setq +doom-dashboard-ascii-banner-fn #'empty-string)


;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(doom-themes-treemacs-root-face ((t (:inherit font-lock-constant-face :bold t :height 1.1))))
 ;; '())

