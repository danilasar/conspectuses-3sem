#let csv2table(file, header, caption) = {
    set text(
		size: 12pt,
		font: "PT Serif",
		lang: "ru",
		region: "ru"
	)
    let types = csv(file)
    let cells = ()
    if header.len() != 0 {
        cells.push(table.header(..header))
    }
    for row in range(0, types.len()) {
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
    figure(
        table(
            columns: types.at(0).len(),
            ..cells
        ), caption: caption
    )
}
