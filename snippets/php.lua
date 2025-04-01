return {
    s('if',
        fmt('if ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('fu',
        fmt('function {}({}){} {{\n\t{}\n}}', {
            i(1, 'Name'),
            i(2),
            c(3, {
                sn(nil, {
                    t(': '),
                    i(1, 'type')
                }),
                t(''),
            }),
            i(4)
        })
    ),
    s('try',
        fmt('try {{\n\t{}\n}} catch ({} ${}) {{\n\t{}\n}}', {
            i(1),
            i(2, 'Exception'),
            i(3, 'e'),
            i(4)
        })
    ),
    s('wh',
        fmt('while ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('fe',
        fmt('foreach (${} as {}${}) {{\n\t{}\n}}', {
            i(1, 'items'),
            c(2, {
                t(''),
                fmt('${} => ', i(1, 'key')),
            }),
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
    s('me',
        fmt('{} function {}({}){} {{\n\t{}\n}}', {
            c(1, {
                t('public'),
                t('private'),
                t('public static'),
            }),
            i(2, 'Name'),
            i(3),
            c(4, {
                sn(nil, {
                    t(': '),
                    i(1, 'type')
                }),
                t(''),
            }),
            i(5),
        })
    ),
    s('for',
        fmt('for (${} = 0; ${} < {}; ${}++) {{\n\t{}\n}}', {
            i(1, 'i'),
            extras.rep(1),
            i(2, '5'),
            extras.rep(1),
            i(3),
        })
    ),
    s('sw',
        fmt([[
        switch (${}) {{
            case '{}':
                {}
                break;{}
            
            default:
                {}
                break;
        }}]], {
            i(1, 'var'),
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
    s('showerr',
        fmt('ini_set(\'display_errors\', \'On\');\nerror_reporting(E_ALL & ~E_DEPRECATED);', {})
    ),
    s('preout',
        fmt('echo \'<pre>\' . var_export(${}, true) . \'</pre>\';', {
            i(1, 'var')
        })
    ),
    s('ar',
        fmt('{}${}', {
            c(1, {
                sn(nil, {
                    i(1, 'string'),
                    t(' '),
                }),
                t(''),
            }),
            i(2, 'arg'),
        })
    ),
    s('va',
        fmt('${} = {};', {
            i(1, 'var'),
            i(2, 'null'),
        })
    ),
    s('pr',
        fmt('{} {}${}{}', {
            c(1, {
                t('private'),
                t('public'),
            }),
            c(2, {
                sn(nil, {
                    i(1, 'string'),
                    t(' '),
                }),
                t(''),
            }),
            i(3, 'prop'),
            c(4, {
                t(';'),
                sn(nil, {
                    t(' = '),
                    i(1, 'null'),
                    t(';'),
                }),
            }),
        })
    ),
    s('class',
        fmt([[
        {}class {} {}{{
            {}

            function __construct({}) {{
                {}
            }}{}
        }}]], {
            c(1, {
                t('final '),
                t(''),
            }),
            i(2, 'Name'),
            i(3),
            i(4),
            i(5),
            i(6),
            i(7),
        })
    ),
    s('rn',
        fmt('return{}', {
            c(1, {
                t(';'),
                sn(nil, {
                    t(' $'),
                    i(1, 'var'),
                    t(';'),
                }),
                sn(nil, {
                    t(' '),
                    i(1, 'true'),
                    t(';'),
                }),
            }),
        })
    ),
    s('intf',
        fmt('interface {} {{\n\t{}\n}}', {
            i(1, 'Name'),
            i(2),
        })
    ),
}
