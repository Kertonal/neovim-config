function getReturnTypeNodes()
    return {
        t(''),
        t(': string'),
        t(': int'),
        t(': float'),
        t(': array'),
        t(': bool'),
        t(': void'),
        t(': mixed'),
        t(': callable'),
        t(': resource'),
    }
end

return {
    s('if',
        fmt('if ({}) {{\n\t{}\n}}', {
            i(1),
            i(2)
        })
    ),
    s('f',
        fmt('function {}({}){} {{\n\t{}\n}}', {
            i(1, 'Name'),
            i(2),
            c(3, getReturnTypeNodes()),
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
        fmt('foreach (${} as {}${}) {{\n\t{}\n}}', {
            i(1, 'arr'),
            c(1, {
                t(''),
                fmt('${} => ', i(1, 'key')),
            }),
            i(2, 'item'),
            i(3),
        })
    ),
    s('con',
        fmt('function __construct({}) {{\n\t{}\n}}', {
            i(1),
            i(2),
        })
    ),
    s('m',
        fmt('{} function {}({}){} {{\n\t{}\n}}', {
            c(1, {
                t('public'),
                t('private'),
            }),
            i(2, 'Name'),
            i(3),
            c(4, getReturnTypeNodes()),
            i(5),
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
    s('case',
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
}
