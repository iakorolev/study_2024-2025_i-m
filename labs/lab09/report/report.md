---
## Front matter
title: "Лабораторная работа № 9"
subtitle: "Голодные студенты"
author: "Королёв Иван Андреевич"

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
lot: true # List of tables
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
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
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

Необходимо построить модель, которая описывает студентов, обедающих пирожками

# Задание

1. Построить модель
2. Сформулировать отчет о пространстве состояний
3. Построить граф состояний

# Выполнение лабораторной работы

## Построение модели

Реализация модели. Рисуем граф сети, добавляем позиции, переход и дуги. (рис. [-@fig:001]).

![Модель](image/1.png){#fig:001 width=70%}

Задаем новые декларации: типы фишек, начальные значений позиций и выражения для дуг. (рис. [-@fig:002]).

![Декларации](image/2.png){#fig:002 width=70%}

## Отчет о пространстве состояний

Отчет о пространстве состояний (рис. [-@fig:003]).

![Отчет о пространстве состояний](image/3.png){#fig:003 width=70%}

## Граф состояний   

Граф состояний. Демонстрирует, в каком состоянии находиться модель, чему равны значения переменных в определенном состоянии. (рис. [-@fig:004]).

![Граф состояний](image/4.png){#fig:004 width=70%}

# Выводы

Построил модель, которая описывает студентов, обедающих пирожками

# Список литературы{.unnumbered}

::: {#refs}
:::
