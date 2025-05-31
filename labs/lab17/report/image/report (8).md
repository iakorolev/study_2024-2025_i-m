---
## Front matter
title: "Лабораторная работа 17"
subtitle: "Имитационное моделирование"
author: "Королёв Иван Андрееич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: false # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Реализовать с помощью gpss модели работы вычислительного центра, аэропорта и морского порта.

# Задание

Реализовать с помощью gpss:

- модель работы вычислительного центра;
- модель работы аэропорта;
- модель работы морского порта.


# Выполнение лабораторной работы

## Моделирование работы вычислительного центра

Построение модели работы вычислительного центра. Задается хранилище ram на две заявки. Затем записаны три блока: первые два обрабатывают задания класса A и B, используя один элемент ram, а третий обрабатывает задания класса C, используя два элемента ram. (рис. [-@fig:001]).

![Модель работы вычислительного центра](image/4.png){#fig:001 width=70%}

Отчёт (рис. [-@fig:002]

![Отчёт модели работы вычислительного центра](image/1.png){#fig:002 width=70%}

Загруженность системы равна 0.994.

## Модель работы аэропорта

Построение модели работы аэропорта. Если полоса пустая, то заявка просто отрабатывается, если нет, то происходит переход в блок ожидания. При ожидании заявка проходит в цикле 5 раз, каждый раз проверяется не освободилась ли полоса, если освободилась -- переход в блок обработки, если нет -- самолет обрабатывается дополнительным обработчиком отправления в запасной аэродром. (рис. [-@fig:003]).

![Модель работы аэропорта](image/3.png){#fig:003 width=70%}

Отчет (рис. [-@fig:004]

![Отчёт по модели работы аэропорта](image/2.png){#fig:004 width=90%}

Взлетело 142 самолета, село 146, а в запасной аэропорт отправилось 0. Коэффициент загрузки полосы равняется 0.4.

## Моделирование работы морского порта

**Первый вариант модели**

Построение модели (рис. [-@fig:005]).

![Модель работы морского порта](image/6.png){#fig:005 width=70%}

Отчет (рис. [-@fig:006]).

![Отчет по модели работы морского порта](image/5.png){#fig:006 width=90%}

Наименьшее возможное число причалов -- 3, получаем оптимальный результат, что видно на отчете

Модель с оптимальным количество причалов (рис. [-@fig:007])

![Модель работы морского порта с оптимальным количеством причалов](image/8.png){#fig:007 width=90%}

Отчет модели с оптимальным количеством причалов (рис. [-@fig:008]).

![Отчет по модели работы морского порта с оптимальным количеством причалов](image/7.png){#fig:008 width=90%}

**Второй вариант модели**

Построение модели (рис. [-@fig:009]).

![Модель работы морского порта](image/10.png){#fig:009 width=70%}

Отчет (рис. [-@fig:010]).

![Отчет по модели работы морского порта](image/9.png){#fig:010 width=90%}

Наименьшее возможное число причалов -- 2, получаем оптимальный результат, что видно из отчета.

Модель с оптимальным количество причалов (рис. [-@fig:011])

![Модель работы морского порта с оптимальным количеством причалов](image/12.png){#fig:011 width=90%}

Отчет модели с оптимальным количеством причалов (рис. [-@fig:012])

![Отчет по модели работы морского порта с оптимальным количеством причалов](image/11.png){#fig:012 width=90%}

# Выводы

Реализованы модели: 

- модель работы вычислительного центра;
- модель работы аэропорта;
- модель работы морского порта.
