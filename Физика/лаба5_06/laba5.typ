= ЛАБОРАТОРНАЯ РАБОТА №5
/ Наименование работ: Изучение работы электроизмерительных приборов
/ Цель работы: проверка электроизмерительных приборов, определение их класса точности, проверить степень равномерности шкалы
/ Принадлежности:
+ амперметр
+ вольтметр
/ Рабочая формула:
//$ n = frac(V_"изм", V_"В") = frac(r_"B" + r_g, r_B) = 1 + frac(r_g, r_B) $
$ gamma = frac(Delta A_(max), A_H) dot 100% $
== Ход работы

- $A$ --- показания испытуемого прибора
- $A_(0+)$ и $A_(0-)$ --- значения показаний эталонного прибора при приближении со стороны нуля и при приближении со стороны максимального значения.
- $overline(A)$ --- среднее значение показаний эталонного прибора
- $delta A$ --- поправка к показаниям испытуемого прибора

Абсолютная погрешность рабочего прибора:
$ Delta A = A - A_0 $

Величина абсолютной погрешности, взятая с обратным знаком, называется поправкой:
$ delta A = - Delta A $

#let aboba = csv("aboba.csv")
#let volts = csv("volts.csv")

#table(columns: 7, 
table.header($A$, $A_(0+)$, $A_(0-)$, $overline(A)$, $delta A$, $Delta A$, $beta, %$),
..aboba.flatten()
)

#table(columns: 7, 
table.header($V$,$V_(0+)$,$V_(0-)$,$overline(V)$,$delta V$,$Delta V$,$beta, %$), 
..volts.flatten(), 
)

График измерений амперметра:

#h(80pt) $delta A$
#v(-10pt)
#figure(
    image(width: 70%, "graphic.png")
)

График измерений вольтметра:
#figure(
    image(width: 70%, "dvaz.png")
)

Зависимость от показаний эталонного амперметра:

#h(80pt) $A$
#v(-10pt)
#figure(
    image(width: 70%, "graphic.png")
)

Зависимость от показаний эталонного вольтметра:

#h(80pt) $V$
#v(-10pt)
#figure(
    image(width: 70%, "4.png")
)

Зависимости близки к линейным и полностью соответствуют начиная с $V_0 = 0,7$.

Определим классы точности с помощью приведённой относительной погрешности:
$ gamma = frac(Delta A_(max), A_H) dot 100% = frac(0 "," 005, 0 "," 25) dot 100% = 2% => "класс точности - " 2 $
$ gamma = frac(Delta V_(max), V_H) dot 100% = frac(0 "," 006, 1 "," 50) dot 100% = 0,4% => "класс точности - " 0,5 $

== Вывод Данилы
В ходе исследования были проанализированы электроизмерительные приборы, такие как амперметр и вольтметр. Были составлены необходимые графики и установлен класс точности каждого прибора. В данном случае класс точности составляет 2 для амперметра и 0,5 для вольтметра, что указывает на то, что вольтметр обладает меньшей точностью по сравнению с амперметром. Измерения сопровождаются погрешностями, которые могут возникать из-за недостатков самого прибора, влияния внешних факторов или ошибок оператора. Важно отметить, что на корпусе амперметра указан класс погрешности 1,0 и это не соответствует действительности.
== Вывод Виктории
Вольтметры и амперметры — это инструменты, предназначенные для измерения электрических величин в определённых диапазонах. Каждый из этих приборов обладает уникальными характеристиками точности, которые могут варьироваться в зависимости от модели. Класс точности представляет собой обобщённый показатель, который определяет, в каких пределах могут находиться относительные погрешности измерений данного устройства. Чем меньше значение погрешности, тем выше точность прибора. На основе проведённых нами экспериментов можно сделать вывод, что амперметры обеспечивают более высокую точность измерений по сравнению с вольтметрами.
