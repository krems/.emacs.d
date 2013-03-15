Emacs Starter Kit это пакет базовых настроек редактора Emacs, он
идеален для быстрого начала работы, дополнения своими настройками и
переноса между компьютерами.

Это форк оригинального Emacs Starter Kit, выполненный в виде
литературной программы на русском языке. Почитать о программе можно в
моем [блоге](http://zahardzhan.github.com/2010/emacs-starter-kit-the-program.html).

## Установка

Emacs Starter Kit рассчитан на работу с Emacs от 22-ой версии и
выше. Вам понадобится система контроля версий *git*.

Установка Emacs Starter Kit элементарна: клонируйте git-репозиторий с
гитхаба в директорию `.emacs.d`; но перед эти сохраните старые
настройки и удалите директорию `.emacs.d`:

    rm -Rv ~/.emacs.d
    git clone http://github.com/zahardzhan/emacs-starter-kit.git ~/.emacs.d
   
Затем установите
[git-сабмодули](http://www.kernel.org/pub/software/scm/git/docs/user-manual.html#submodules)
сторонних пакетов
   
    cd ~/.emacs.d/
    git submodule init
    git submodule update
   
и соберите последнюю версию Org-mode
   
    cd ~/.emacs.d/src/org/
    make

Запустите Emacs.

После того как закончите установку вам, возможно, потребуется
перезапустить Emacs несколько раз — во время загрузки пакетов из
архива пакетов Emacs Lisp [ELPA](http://tromey.com/elpa/) происходят
ошибки разбора HTML — просто проигнорируйте их.

Если после очередного обновления вы потеряете некоторые
автозагрузчики, что даст знать о себе сообщениями об ошибках типа
`void function: foobar`, попробуйте использовать команду *M-x
regen-autoloads*.

Последнюю версию Emacs Starter Kit можно найти на гитхабе:
https://github.com/zahardzhan/emacs-starter-kit.

Оригинальная версия: https://github.com/technomancy/emacs-starter-kit.
