;; spell-check
;; ###########
(require 'flyspell)
(require 'ispell)
 
(setq
 ; i like aspel, and you?
 ispell-program-name "aspell"
 
 ; my dictionary-alist, using for redefinition russian dictionary
 ispell-dictionary-alist
 '(("english"                       ; English
    "[a-zA-Z]"
    "[^a-zA-Z]"
    "[']"
    nil
    ("-d" "en")
    nil iso-8859-1)
   ("russian"                       ; Russian
    "[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
    "[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
    "[-]"
    nil
    ("-C" "-d" "ru")
    nil utf-8)
   (nil                             ; Default
    "[A-Za-z]"
    "[^A-Za-z]"
    "[']"
    nil
    ("-C")
    nil iso-8859-1))
 
 ispell-russian-dictionary "ru-ye"
 ispell-english-dictionary "english"
 flyspell-default-dictionary ispell-russian-dictionary
 ispell-local-dictionary ispell-russian-dictionary
 ispell-extra-args '("--sug-mode=ultra"))
 
(defun flyspell-russian ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary ispell-russian-dictionary)
  (flyspell-buffer))
 
; English
(defun flyspell-english ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary ispell-english-dictionary)
  (flyspell-buffer))
 
(global-set-key [f7] 'ispell-buffer)
(global-set-key [f8] 'ispell-region)
(global-set-key [f9] 'flyspell-english)
(global-set-key [f10] 'flyspell-russian)
(global-set-key [f11] 'flyspell-mode)
