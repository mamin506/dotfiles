(require-package 'evil)

(evil-mode 0)

;; Do not use evil-mode on org-mode
(evil-set-initial-state 'org-mode 'emacs)

;;(add-hook 'evil-after-load-hook
;;         (lambda ()
;;         ;; config
;;	   ))

(provide 'init-evil)
