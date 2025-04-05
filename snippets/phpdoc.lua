return {
    s('/*',
        c(1, {
            fmt('/**\n * {}\n */', {
                i(1),
            }),
            fmt('/** {} */', {
                i(1),
            }),
        })
    ),
    s('@v',
        fmt('@var {}', {
            i(1, 'string'),
        })
    ),
    s('@p',
        fmt('@param {} ${}', {
            i(1, 'string'),
            i(2, 'name'),
        })
    ),
    s('@r',
        fmt('@return {}', {
            i(1, 'string'),
        })
    ),
}
