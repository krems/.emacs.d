(require 'color-theme)
(color-theme-generated)

;; Set font
;;(set-default-font "-unknown-Terminus-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-default-font
;; "-unknown-TlwgMono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; not bad too
;; Set font'n'background color
;; (set-foreground-color "black")
;; (set-background-color "dark grey")
;; Set selection area color
;; (set-face-background 'region "light blue")
;; Set curosor color
;; (set-cursor-color "blue")
;; Scrolling height
(setq scroll-step 1)
;; Highlighting current string
(global-hl-line-mode 1)
(set-face-background 'hl-line "#0e2735")  
;; Highlighing strings with tabs and longer than 80 characters
(add-hook 'c++-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-blue)))
(add-hook 'python-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-blue)))
;; Indicating line numbers
(global-linum-mode t)
;; (add-hook 'c++-mode-hook '(lambda () ((linum-mode t))))
;; (add-hook 'python-mode-hook '(lambda () ((linum-mode 1))))
;; Set mode-line color
(set-face-background 'modeline "#444343")
;; Show column number in mode line
(setq column-number-mode t)

;; TODO: move to other conf file
;; Using y/n, but not yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; Save session
(desktop-save-mode t)
;; Backspace bind
(global-set-key (kbd "C-<") 'delete-backward-char)
;; Full screen on start
(defun toggle-full-screen () (interactive)
  (shell-command "emacs_fullscreen.exe"))
(global-set-key [f11] 'toggle-full-screen)
(toggle-full-screen)
;; (defun fullscreen ()
;;        (interactive)
;;        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                               '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
;; without x-buttons
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (defun fullscreen (&optional f)
;;  (interactive)
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;             '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;             '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;; (fullscreen)
;; C-'russian letter' -> C-'english letter'
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))
;; Disable at passwd fields
(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))
;; Run previous two on latex
(add-hook 'latex-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'tex-default-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'plain-tex-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'slitex-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'doctex-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'LaTeX-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
(add-hook 'TeX-mode-hook (lambda ()(reverse-input-method 'russian-computer)))
