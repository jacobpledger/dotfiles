;; Package Control
;; ---------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Packages
;; --------
(require 'multiple-cursors)
(require 'use-package)

;; Use company-mode completion in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Hook the Pyright LSP to Python mode
(use-package lsp-pyright
  :ensure t
  :config
  (setq dap-python-debugger 'debugpy)
  (require 'dap-python)
  :init (when (executable-find "python3")
	  (setq lsp-pyright-python-executable-cmd "python3")
;;	  (setq python-shell-interpreter "python3")
;;	  (setq dap-python-executable "python3")
	  )
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp-deferred))))  ; or lsp


;; Custom Functions
;; ----------------
(defun revert-all-buffers ()
  "Refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in emacs will not be reverted. They
will be reverted though if they were modified outside emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      ;; Revert only buffers containing files, which are not modified;
      ;; do not try to revert non-file buffers like *Messages*.
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            ;; If the file exists and is readable, revert the buffer.
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          ;; Otherwise, kill the buffer.
          (let (kill-buffer-query-functions) ; No query done when killing buffer
            (kill-buffer buf)
            (message "Killed non-existing/unreadable file buffer: %s" filename))))))
  (message "Finished reverting buffers containing unmodified files."))

;; Drag lines around.

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


;; Keybindings
;; -----------
;; Multiple Cursors
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Below Require Packages
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c p b") 'python-black-buffer)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<down>"))
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)


;; Preferences
(setq column-number-mode t)
(setq company-idle-delay 0) ; No delay in showing suggestions.
; Show suggestions after entering one character.
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t) ; Suggestion list loops


;; Auto-Generated - DO NOT TOUCH
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company company-anaconda yaml-mode magit pyenv-mode-auto pyenv-mode dap-mode flycheck python-black python-mode use-package lsp-pyright multiple-cursors))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

