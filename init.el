;;; init.el --- Basic init.
;;; Commentary:
;;; Code:

(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your emacs is old, and some functionality in this config will be disabled. PLease upgrade if possible."))

(defconst *is-a-mac* (eq system-type 'darwin))


(setq custom-file (locate-user-emacs-file "custom.el"))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-elpa)
(require 'init-lisp)
(require 'init-eglot)
(require 'init-themes)
(require 'init-mode-line)
(require 'init-rust)
(require 'init-osx)
(require 'init-sail)

(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
