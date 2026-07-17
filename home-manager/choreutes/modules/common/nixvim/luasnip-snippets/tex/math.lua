local math_snippets = {
    s(
        {
            trig = "eqn",
            dscr = "Numbered equation/displaymath environment",
        },
        fmta(
            [[
            \begin{equation} \label{eq:<>}
              <>
            \end{equation}
            ]],
            {
                i(1, "Label"),
                i(2, "The hard stuff...")
            }
        )
    ),
}

return math_snippets
