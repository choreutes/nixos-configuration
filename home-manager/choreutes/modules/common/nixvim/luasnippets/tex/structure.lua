local structure_snippets = {
    s(
        {
            trig = "part",
            dscr = "New part",
        },
        fmta(
            [[
            \part{<>}
            \label{part:<>}

            <>
            ]],
            {
                i(1, "Heading"),
                i(2, "Label"),
                i(0)
            }
        )
    ),

    s(
        {
            trig = "chap",
            dscr = "New chapter",
        },
        fmta(
            [[
            \chapter{<>}
            \label{chap:<>}

            <>
            ]],
            {
                i(1, "Heading"),
                i(2, "Label"),
                i(0)
            }
        )
    ),

    s(
        {
            trig = "sect",
            dscr = "New section",
        },
        fmta(
            [[
            \section{<>}
            \label{sect:<>}

            <>
            ]],
            {
                i(1, "Heading"),
                i(2, "Label"),
                i(0)
            }
        )
    ),

    s(
        {
            trig = "itmz",
            dscr = "New itemization",
        },
        fmta(
            [[
            \begin{itemize}
              \item <>
            \end{itemize}
            ]],
            {
                i(0)
            }
        )
    ),

    s(
        {
            trig = "enum",
            dscr = "New enumeration",
        },
        fmta(
            [[
            \begin{enumerate}
              \item <>
            \end{enumerate}
            ]],
            {
                i(0)
            }
        )
    ),
}

return structure_snippets
