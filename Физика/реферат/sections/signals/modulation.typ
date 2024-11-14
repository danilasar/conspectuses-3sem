#import "../../utils/csv2table.typ": csv2table
== Модуляция сигнала

Системы связи способны обрабатывать как цифровые, так и аналоговые сигналы. В беспроводных сетях, где компьютеры обмениваются информацией, сигнал представляет собой электромагнитную волну, а данные --- это дискретные значения. Для передачи этих данных требуется преобразование двоичных чисел в аналоговый сигнал.

/ Модуляция: --- это процесс преобразования цифровых данных в аналоговый сигнал, который затем используется для передачи информации через различные каналы связи. Различные методы модуляции позволяют использовать различные характеристики электромагнитной волны для кодирования и передачи данных, что позволяет достичь различных целей, таких как повышение скорости передачи данных, улучшение устойчивости к помехам и повышение надежности передачи информации.

=== Амплитудная модуляция
Амплитудная модуляция заключается в изменении амплитуды несущего сигнала в соответствии с информационным сигналом. При этом частота и фаза остаются постоянными. Основным преимуществом AM является простота реализации, что делает её популярной в радиовещании и других аналоговых системах.

В процессе амплитудной модуляции несущий сигнал смешивается с модулирующим сигналом. Результатом является спектр, содержащий несущую частоту и две боковые полосы (спутники). Эти боковые полосы представляют собой частоты, которые находятся на фиксированном расстоянии от несущей частоты и зависят от амплитуды модулирующего сигнала.

Основным недостатком амплитудной модуляции является её уязвимость к помехам и шумам. Изменения в амплитуде могут быть вызваны внешними факторами, что приводит к искажению передаваемого сигнала. Поэтому амплитудная модуляция часто используется в условиях, где помехи минимальны, и это явно не случай Wi-Fi.

=== Частотная модуляция
Частотная модуляция, также известная как FM, подразумевает изменение частоты несущего сигнала в зависимости от мгновенных значений модулирующего сигнала. В отличие от амплитудной модуляции, при частотной амплитуда остается постоянной, что обеспечивает более высокую помехозащищённость.

При частотной модуляции максимальное отклонение частоты от несущей называется девиацией. Индекс модуляции определяется как отношение девиации к частоте модулирующего сигнала. Частотно-модулированные сигналы обладают высокой устойчивостью к шумам и интерференции, что делает их идеальными для радиовещания и передачи звука.

Частотная модуляция широко используется в радиовещании (например, FM-радио), телевидении и радиотелефонии. Это связано с тем, что FM-сигналы обеспечивают высокое качество звука и устойчивость к помехам.
=== Фазовая модуляция
Фазовая модуляция заключается в изменении фазы несущего сигнала в соответствии с информационным сигналом. Как и в случае с FM, амплитуда остаётся постоянной. Фазовая модуляция может быть описана как процесс изменения фазы сигнала на фиксированное значение в зависимости от уровня модулирующего сигнала. Это позволяет передавать информацию с высокой точностью и минимальными потерями.

Фазовая модуляция часто используется в цифровых системах связи, таких как системы передачи данных и беспроводные сети. Она также применяется в некоторых форматах телевидения и радиовещания для улучшения качества передачи.
=== Квадратурная амплитудная модуляция (КАМ)
Квадратурная амплитудная модуляция (КАМ) является одной из самых эффективных техник модуляции, используемых в современных системах передачи данных. Она сочетает в себе изменения как амплитуды, так и фазы несущего сигнала, что позволяет значительно увеличить скорость передачи информации. Рассмотрим подробнее принципы работы QAM, ее применение и преимущества.

КАМ основывается на использовании двух несущих сигналов, которые сдвинуты по фазе на 90 градусов ($frac(pi, 2)$ радиан). Эти сигналы обычно обозначаются как $I$ (инфаза) и $Q$ (квадратура). Каждый из этих сигналов модулируется по амплитуде своим модулирующим сигналом:
$ S(t) = I(t) cos(2 pi f_0 t) + Q(t) sin(2 pi f_0 t), $
где
- $I(t)$ и $Q(t)$ --- модулирующие сигналы
- $f_0$ --- несущая частота
- $t$ --- время

В результате получается комбинированный сигнал, который содержит информацию как об изменении амплитуды, так и о фазе.

При формировании КАМ-сигнала количество возможных состояний определяется количеством бит, которые могут быть переданы за один символ. Например, в 16-КАМ используется 16 различных состояний, что позволяет передавать 4 бита информации за один символ. Каждое состояние соответствует определенной комбинации значений амплитуды и фазы для сигналов $I$ и $Q$.


#csv2table(
    "../data/signals/qam.csv",
    ([*Созвездие*], [*Бит на символ*]),
    "Наиболее часто используемые созвездия КАМ"
) <wave_types>

КАМ позволяет эффективно использовать доступный спектр частот, что приводит к увеличению объема передаваемых данных без необходимости расширять полосу пропускания. И хотя более высокие уровни КАМ требуют лучшего соотношения сигнал/шум, они всё же обеспечивают надёжную и защищённую от помех передачу данных при достаточном уровне сигнала. КАМ весьма универсальна, ведь она может адаптироваться к различным условиям передачи и требованиям к качеству связи,

Для избежания потенциальных ошибок, как правило, в КАМ запрещено использовать одинаковую амплитуду соседним по фазе сигналам.
