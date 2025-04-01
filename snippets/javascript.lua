return {
    s('if',
        fmt('if ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('fu',
        fmt('function {}({}) {{\n\t{}\n}}', {
            i(1, 'Name'),
            i(2),
            i(3)
        })
    ),
    s('try',
        fmt('try {{\n\t{}\n}} catch ({}){{\n\t{}\n}}', {
            i(1),
            i(2, 'err'),
            i(3)
        })
    ),
    s('wh',
        fmt('while ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('sw',
        fmt([[
        switch ({}) {{
            case '{}':
                {}
                break;{}
            
            default:
                {}
                break;
        }}]], {
            i(1),
            i(2),
            i(3),
            i(4),
            i(5),
        })
    ),
    s('ca',
        fmt('case \'{}\':\n\t{}\n\tbreak;', {
            i(1),
            i(2),
        })
    ),
}
