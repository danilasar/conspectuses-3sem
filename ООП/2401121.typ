= UML
UML --- Unified Modeling Language --- предназначен для визуального представления структуры программы.

Начало 80х --- начало объектно-ориентированной эры.

80е --- война методов. Один и тот же символ в разных нотациях имел разный смысл, что привело к началу стандартизации в 1991 году и к 1997 году окончательному формированию UML.

== CASE-средства

CASE-средства реализуют UML-моделирование. Среди них:

- Visual Paradigm
- BM Rational Rose
- Borland Together (мертва)
- rvim, bpvim

== Виды диаграмм
В языке UML 12 типов диаграмм. Самые интересные:
- прецеденты
- классы
- объекты
- последовательности
- взаимодействия
- состояния
- активности
- развёртывания

/ Актор: 

/ Прецедент: описание отдельного аспекта поведения системы с точки зрения пользователя.

Прецедент представляет поведение сущности, описывая взаимодействие между акторами и системой.

#image(width: 25%, "imgs/001.png")

== Class diagram
/ Класс: --- категория вещей, которые имеют общие атрибуты и операции.
/ Диаграмма классов: --- это набор статических, декларативных элементов модели.

#image(width: 25%, "imgs/002.png")
_стрелки должны быть с белым контуром и без заливки, они указывают на родительский класс_

Рассмотрим пример. Создать ПО для работы банкомата. Основная функция --- выдать бабки. Участники процесса:

/*#table(columns: 4,
table.header([], [Клиент], [Банкомат], [Банк]),
[], [Вставить карту], [Проверка на валидность], []
)*/

= Collaboration diagram


