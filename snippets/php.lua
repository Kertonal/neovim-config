return {
    s('if',
        fmt('if ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('f',
        fmt('function {}({}): {} {{\n\t{}\n}}', {
            i(1, 'Name'),
            i(2),
            i(3, 'type'),
            i(4)
        })
    ),
    s('try',
        fmt('try {{\n\t{}\n}} catch ({} ${}){{\n\t{}\n}}', {
            i(1),
            i(2, 'Exception'),
            i(3, 'e'),
            i(4)
        })
    ),
    s('while',
        fmt('while ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('fe',
        fmt('foreach (${} as ${}) {{\n\t{}\n}}', {
            i(1, 'arr'),
            i(2, 'item'),
            i(3),
        })
    ),
    s('fe=',
        fmt('foreach (${} as ${} => ${}) {{\n\t{}\n}}', {
            i(1, 'arr'),
            i(2, 'key'),
            i(3, 'item'),
            i(4),
        })
    ),
    s('con',
        fmt('function __construct({}) {{\n\t{}\n}}', {
            i(1),
            i(2),
        })
    ),
    s('m',
        fmt('{} function {}({}): {} {{\n\t{}\n}}', {
            c(1, {
                t('public'),
                t('private'),
            }),
            i(2, 'Name'),
            i(3),
            i(4, 'type'),
            i(5),
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
    s('case',
        fmt('case \'{}\':\n\t{}\n\tbreak;', {
            i(1),
            i(2),
        })
    ),
}
