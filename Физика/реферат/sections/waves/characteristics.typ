#import "@preview/cetz:0.3.0"
== Характеристики волны
Любые волны --- как механические, так и электромагнитные --- обладают пятью основными характеристиками, а именно:
+ Амплитуда $A$
+ Частота $V$
+ Период $T = frac(1,V)$
+ Длина волны $lambda$
+ Скорость распространения $v$
+ Фаза

/ Амплитуда: --- это максимальное отклонение волны от её равновесного положения, связанная с величиной электрического и магнитного полей. Она напрямую зависит от переносимой волной энергией: чем её больше, тем выше амплитуда. 
#figure(
    cetz.canvas(length: 3cm, {
        import cetz.draw: *

        set-style(
            mark: (fill: black, scale: 2),
            stroke: (thickness: 0.4pt, cap: "round"),
            angle: (
                radius: 0.3,
                label-radius: .22,
                fill: green.lighten(80%),
                stroke: (paint: green.darken(50%))
            ),
            content: (padding: 1pt)
        )

        grid((0, -1), (2, 1), step: 0.5, stroke: gray + 0.2pt)

        let len = 1000
        line(..(for x in range(0, len + 1) {
            let amplitude = 1
            let phases = 2
            let scale = 2
            let x = x / len
            let p = (2 * phases * calc.pi) * x
            ((x * scale, calc.sin(p) * amplitude),)
        }), name: "sin")
        line((0, 0), (2, 0), mark: (end: "stealth"))
        content((), [#v(-5pt) #h(15pt) $t$], anchor: "west")
        line((0, -1), (0, 1), mark: (end: "stealth"))
        content((), [$y$ #v(15pt)], anchor: "south")
        line((2, -1), (2, 1), mark: (start: "stealth", end: "stealth", fill: red), stroke: red + 0.4pt, name: "ampline")
        content(("ampline.start", 50%, "ampline.end"),  text(red)[Амплитуда], anchor: "north", angle: 90deg)
    }),
    caption: "Амплитуда колебаний",
    supplement: "Рисунок"
) <amplitude_plot>
Если амплитуда определяет энергию волны, то частота и период описывают временные характеристики волн.
/ Частота: --- это количество полных колебаний, которые происходят за единицу времени (секунду). Она измеряется в Герцах и, нетрудно догадаться, $1 text("Гц") = 1 space text("с")^(-1)$.
/ Период: --- время, которое требуется для завершения одного полного цикла колебания. Само собой, оно измеряется в секундах.
#figure(
    cetz.canvas(length: 3cm, {
        import cetz.draw: *

        set-style(
            mark: (fill: black, scale: 2),
            stroke: (thickness: 0.4pt, cap: "round"),
            angle: (
                radius: 0.3,
                label-radius: .22,
                fill: green.lighten(80%),
                stroke: (paint: green.darken(50%))
            ),
            content: (padding: 1pt)
        )

        let len = 1000
        let amplitude = 1

        grid((0, -amplitude), (2, amplitude), step: 0.5, stroke: gray + 0.2pt)

        line(..(for x in range(0, len + 1) {
            let phases = 2
            let scale = 2
            let x = x / len
            let p = (2 * phases * calc.pi) * x
            ((x * scale, calc.sin(p) * amplitude),)
        }), name: "sin")
        line((0, 0), (2, 0), mark: (end: "stealth"))
        content((), [#v(-5pt) #h(15pt) $t$], anchor: "west")
        line((0, -amplitude), (0, amplitude), mark: (end: "stealth"))
        content((), [$y$ #v(15pt)], anchor: "south")
        line((0.25, amplitude), (1.25, amplitude), mark: (start: "stealth", end: "stealth", fill: red), stroke: red + 0.4pt, name: "ampline")
        content(("ampline.start", 50%, "ampline.end"),  text(red)[Период #v(3pt)], anchor: "south")
    }),
    caption: "Период колебания",
    supplement: "Рисунок"
) <frequency_plot>
/ Фаза: --- относительное значение, которое показывает, какая часть перода $frac(t, T)$ прошла с момента последнего прохождения функции волны через нуль.
#figure(
    cetz.canvas(length: 3cm, {
        import cetz.draw: *

        set-style(
            mark: (fill: black, scale: 2),
            stroke: (thickness: 0.4pt, cap: "round"),
            angle: (
                radius: 0.3,
                label-radius: .22,
                fill: green.lighten(80%),
                stroke: (paint: green.darken(50%))
            ),
            content: (padding: 1pt)
        )

        let len = 1000
        let amplitude = 1

        grid((0, -amplitude), (2, amplitude), step: 0.5, stroke: gray + 0.2pt)

        line(..(for x in range(0, len + 1) {
            let phases = 2
            let scale = 2
            let x = x / len
            let p = (2 * phases * calc.pi) * x
            ((x * scale, calc.sin(p) * amplitude),)
        }), name: "sin")
        line((0, 0), (2, 0), mark: (end: "stealth"))
        content((), [#v(-5pt) #h(15pt) $t$], anchor: "west")
        line((0, -amplitude), (0, amplitude), mark: (end: "stealth"))
        content((), [$y$ #v(15pt)], anchor: "south")
        line((0.5, 0), (0.9, 0), mark: (start: "stealth", end: "stealth", fill: red), stroke: red + 0.4pt, name: "ampline")
        line((0.9, -amplitude), (0.9, amplitude), mark: (fill: red), stroke: red + 1.5pt, name: "time")
        content(("ampline.start", 50%, "ampline.end"),  text(red)[Фаза #v(5pt)], anchor: "south")
    }),
    caption: "Фаза колебания",
    supplement: "Рисунок"
) <phase_plot>
