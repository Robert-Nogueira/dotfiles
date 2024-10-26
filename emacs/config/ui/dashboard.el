;;; dashboard.el --- Emacs Dashboard Configuration
;;; Commentary:

;; This file sets up the Emacs dashboard, customizing the appearance, icons,
;; widgets, and layout.  It includes options for displaying recent files
;; projects, bookmarks, and an agenda from org-mode.

;;; Code:

;; Ensure nerd-icons is loaded before configuring dashboard
(use-package nerd-icons
  :ensure t
  :config
  (setq nerd-icons-font-family "Symbols Nerd Font Mono"))

;; Now configure dashboard after nerd-icons is loaded
(use-package dashboard
  :ensure t
  :custom
  (dashboard-setup-startup-hook)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-center-content t)
  (dashboard-banner-logo-title "I use emacs btw 🤓☝️")
  (dashboard-startup-banner "/home/robert/.emacs.d/config/ui/_.gif")
  (dashboard-footer-messages '("Strong coffee, strong code."))
    (dashboard-footer-icon
        (nerd-icons-mdicon "nf-md-coffee" :height 1.0 :v-adjust -0.05))
  (dashboard-items '((projects  . 5)
                     (recents . 5)))

  (dashboard-startupify-list '(dashboard-insert-banner
                                    dashboard-insert-newline
                                    dashboard-insert-banner-title
                                    dashboard-insert-newline
                                    dashboard-insert-navigator
                                    dashboard-insert-items
                                    dashboard-insert-newline
                                    dashboard-insert-footer
                                    dashboard-insert-newline
                                    dashboard-insert-init-info))

  (dashboard-navigator-buttons
        `(
          ((,(nerd-icons-mdicon "nf-md-github" :height 1.1 :v-adjust 0.0)
             "Github" "Browse GitHub profile"
             (lambda (&rest _) (browse-url "https://github.com/Robert-Nogueira")))

           (,(nerd-icons-mdicon "nf-md-cog" :height 1.1 :v-adjust 0.0)
            "Settings" "Open init.el"
            (lambda (&rest _) (find-file user-init-file))))))
  :config
  (dashboard-setup-startup-hook)

  (set-face-attribute 'dashboard-banner-logo-title nil :height 180 :weight 'bold)
  (set-face-foreground 'dashboard-banner-logo-title "#cba6f7"))

(provide 'dashboard)
;;; dashboard.el ends here