---
## Front matter
title: "Лабораторная работа № 10"
subtitle: "Имитационное моделирование"
author: "Королёв Иван"

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

Освоить программу СPNTools и её основные инструменты. Построить модель задачи об обедающих мудрецах

# Задание

1. Нарисовать граф сети
2. Задать декларации модели
3. Моделирование
4. Отчет о пространстве состояний
5. Граф пространства состояний

# Теоретическое введение

CPN Tools — это инструмент для редактирования, моделирования и анализа сетей Петри высокого уровня. Он поддерживает базовые сети Петри, а также временные сети Петри и цветные сети Петри. Он имеет симулятор и инструмент анализа пространства состояний.

# Выполнение лабораторной работы

## Построение графа сети

Рисую граф сети. Для этого создаю новую сеть, добавляю позиции, переходы и дуги.  (рис. [-@fig:001]).

![Граф](image/1.png){#fig:001 width=70%}

## Декларации модели

Задаю новые декларации модели. Указываю типы фишек, начальные значения позиций и выражения для дуг. Затем указываю эти типы в позициях и переходах. (рис. [-@fig:002]).

![Декларации](image/3.png){#fig:002 width=70%}

## Демонстрация модели

Модель (рис. [-@fig:003]).

![Модель](image/2.png){#fig:003 width=70%}

## Отчет о пространстве состояний

Отчет о пространстве состояний. В отчете указана статистика о состояниях модели, информация о графах, свойства ограниченности, множества и другие математические детали. (рис. [-@fig:004]).

![Модель](image/5.png){#fig:004 width=70%}

## Граф

Граф (рис. [-@fig:005]).

![Модель](image/4.png){#fig:005 width=70%}

# Выводы

Освоил программу СPNTools и её основные инструменты. Построил модель задачи об обедающих мудрецах

# Список литературы{.unnumbered}
imi_mod
::: {#refs}
:::
