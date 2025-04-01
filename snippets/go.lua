return {
    s('va',
        fmt('{} := {}', {
            i(1, 'varName'),
            i(2, '0'),
        })
    ),
    s('ar',
        fmt('{} {}', {
            i(1, 'arg'),
            i(2, 'int'),
        })
    ),
    s('if',
        fmt('if {} {{\n\t{}\n}}', {
            i(1),
            i(2),
        })
    ),
    s('ie',
        fmt('if err != nil {{\n\t{}\n}}', {
            i(1),
        })
    ),
    s('for',
        fmt('for {{\n\t{}\n}}', {
            i(1),
        })
    ),
    s('fr',
        fmt('for {}, {} := range {} {{\n\t{}\n}}', {
            i(1, 'i'),
            i(2, 'v'),
            i(3, 'arr'),
            i(4),
        })
    ),
    s('st',
        fmt('type {} struct {{\n\t{}\n}}', {
            i(1, 'name'),
            i(2),
        })
    ),
    s('sf',
        fmt('{} {}', {
            i(1, 'name'),
            i(2, 'int'),
        })
    ),
    s('stt',
        fmt('`{}:"{}"`', {
            i(1, 'json'),
            i(2, 'fieldName'),
        })
    ),
    s('intf',
        fmt('type {} interface {{\n\t{}\n}}', {
            i(1, 'name'),
            i(2),
        })
    ),
    s('fu',
        fmt('func {}({}){} {{\n\t{}\n}}', {
            i(1, 'name'),
            i(2),
            c(3, {
                sn(nil, {
                    t(' '),
                    i(1, 'int')
                }),
                t(''),
            }),
            i(4),
        })
    ),
    s('rn', t('return nil')),
    s('re', t('return err')),
    s('rne', t('return nil, err')),
}
