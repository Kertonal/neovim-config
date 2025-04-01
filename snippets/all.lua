return {
    s({ trig="''", wordTrig = false },
        fmt("'{}'", { i(1) })
    ),
    s({ trig='""', wordTrig = false },
        fmt('"{}"', { i(1) })
    ),
    s({ trig='[]', wordTrig = false },
        fmt('[{}]', { i(1) })
    ),
    s({ trig='{}', wordTrig = false },
        fmt('{{{}}}', { i(1) })
    ),
    s({ trig='()', wordTrig = false },
        fmt('({})', { i(1) })
    ),
    s({ trig='<>', wordTrig = false },
        fmt('<{}>', { i(1) })
    ),
    s({ trig='``', wordTrig = false },
        fmt('`{}`', { i(1) })
    ),
}
