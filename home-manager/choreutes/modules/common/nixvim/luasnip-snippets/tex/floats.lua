local float_snippets = {
    s(
        {
            trig = "fig",
            dscr = "Figure environment",
        },
        fmta(
            [[
            \begin{figure}
              \centering
              \includegraphics[<><>]{<>}
              \caption{<>}
              \label{fig:<>}
            \end{figure}
            ]],
            {
                i(1, "Factor"),
                c(2, { t("\\textwidth"), t("\\linewidth") }),
                i(3, "Path"),
                i(4, "Caption"),
                i(5, "Label"),
            }
        )
    ),
}

return float_snippets
