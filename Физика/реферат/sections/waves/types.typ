== Виды электромагнитных волн
Электромагнитные волны возникают при движении заряженных частиц и по частоте колебаний делятся на:
#let types = csv("../../data/waves/types.csv")
#let cells = ()
#for row in range(0, types.len()) {
        for column in range(0, types.at(row).len()) {
            let val = types.at(row).at(column)
            if val != "colspan" and val != "rowspan" {
                let colspan = 1
                let rowspan = 1
                for col in range(column + 1, types.at(row).len()) {
                    if types.at(row).at(col) != "colspan" {
                        break
                    }
                    colspan = colspan + 1
                }
                for row in range(row + 1, types.len()) {
                    if types.at(row).at(column) != "rowspan" {
                        break
                    }
                    rowspan += 1
                }
                cells.push(table.cell(colspan: colspan, rowspan: rowspan, eval(val, mode: "markup")))
            }
        }
    }

#table(
    columns: 5,
    table.header(table.cell(colspan: 2, [*Диапазон*]), [*$lambda$*], [*$V$*], [*Источники*]),
    ..cells
)
