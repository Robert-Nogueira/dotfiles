;;; misc.el --- Miscellaneous Configurations
;;; Commentary:
;; This file contains various package configurations that enhance
;; the Emacs experience, including utilities for navigation and
;; clipboard management.

;;; Code:

(defun load-env-file (filepath)
  "Load .env and define in Emacs environment from FILEPATH."
  (when (file-exists-p filepath)
    (with-temp-buffer
      (insert-file-contents filepath)
      (dolist (line (split-string (buffer-string) "\n" t))
        (let ((parts (split-string line "=")))
          (when (= (length parts) 2)
            (setenv (car parts) (cadr parts))))))))

(load-env-file "~/.emacs.d/.env")



(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1)
  :config
  (setq which-key-separator " → ")) ;; Customize the separator

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window))) ;; Bind M-o to ace-window for quick navigation

(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(use-package counsel-spotify
  :ensure t
  :config
  (setq counsel-spotify-client-id (getenv "SPOTIFY_CLIENT_ID"))
  (setq counsel-spotify-client-secret (getenv "SPOTIFY_CLIENT_SECRET")))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(setq keyfreq-excluded-commands
      '(self-insert-command
	mouse-wheel-text-scale
	mwheel-scroll
	vertico-exit
	delete-backward-char
        forward-char
        backward-char
        previous-line
        next-line
	vertico-next
	vertico-insert))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-command "pandoc")
  (setq markdown-preview-stylesheets (list "~/.emacs.d/github-markdown-dark.css"))
)

(use-package markdown-preview-eww
  :ensure t
  :after markdown-mode)

(use-package markdown-preview-mode
  :ensure t)

(use-package centered-cursor-mode
  :ensure t
  :init
  (global-centered-cursor-mode 1)
  )

(use-package expand-region
  :ensure t
  :bind ("C-9" . er/expand-region))

(use-package emojify
  :hook (prog-mode . emojify-mode))

(provide 'misc)
;;; misc.el ends here
