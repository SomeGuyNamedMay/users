;; remove clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(rainbow-mode)
(savehist-mode)

;; file and backup history
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . ".backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;keyboard layout
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))

;; remove clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(rainbow-mode)

;;keybindings
(require 'meow)
(meow-setup)
(meow-global-mode 1)
(add-hook 'prog-mode-hook #'smartparens-mode)

;; ui enhancments
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(doom-modeline-mode 1)
(selectrum-mode)
(setq completion-styles '(orderless))
;; Optional performance optimization
;; by highlighting only the visible candidates.
(setq orderless-skip-highlighting (lambda () selectrum-is-active))
(setq selectrum-highlight-candidates-function #'orderless-highlight-matches)

;; dashboard settings
(dashboard-setup-startup-hook)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-items '((recents . 5)
			(projects . 5)))
(setq dashboard-set-footer nil)

(dirvish-override-dired-mode)
(global-flycheck-mode)
;;tabs
(centaur-tabs-mode t)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)

;; note taking stuff
(latex-preview-pane-enable)

;; project managment
(projectile-mode)

;; programming stuff
(require 'idris2-mode)
(idris2-mode)
(nix-mode)
(rust-mode)
(haskell-mode)
(load-file (let ((coding-system-for-read 'utf-8)) (shell-command-to-string "agda-mode locate")))
;; lsp language hooks
(add-hook 'rust-mode-hook 'lsp)
(add-hook 'haskell-mode-hook 'lsp)
(add-hook 'java-mode-hook 'lsp)
(add-hook 'coq-mode-hook #'company-coq-mode)

;; dap configuration
(dap-mode)
(dap-ui-mode)
(dap-tooltip-mode)
(tooltip-mode)
(dap-ui-controls-mode)

;; prittify text
(setq company-coq-features/prettify-symbols-in-terminals t)
(set-fontset-font t 'unicode (font-spec :name "XITS Math") nil 'prepend)
