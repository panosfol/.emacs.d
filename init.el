;;; init.el --- Basic init.
;;; Commentary:
;;; Code:

(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your emacs is old, and some functionality in this config will be disabled. PLease upgrade if possible."))

(tool-bar-mode -1)

;;; Disable sounds.
(setq visible-bell t)
(setq ring-bell-function 'ignore)

(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file (locate-user-emacs-file "custom.el"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; Packages
(require 'init-elpa)
;;; Packages that don't require special treatment.
(when (maybe-require-package 'nano-modeline) ; Cool modeline
  (nano-modeline-mode 1))

;;; UI
(require 'init-mode-line)
(require 'init-themes)

;;; Editor
(require 'init-editor)
(require 'init-corfu)
(require 'init-org)

;;; Misc
(require 'init-exec-path)
(require 'init-projectile)
(require 'init-debug)

;;; Languages
(require 'init-eglot)
(require 'init-flymake)
(require 'init-lisp)
(require 'init-rust)
(require 'init-sail)
(require 'init-go)

;;; System Specific
(require 'init-osx)



(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
