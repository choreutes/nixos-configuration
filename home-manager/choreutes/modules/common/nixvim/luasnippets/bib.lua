return {
    s(
        {
            trig = "art",
            dscr = "Article entry in bibliography",
        },
        fmta(
            [[
            @Article{<>,
              author       = {<>},
              date         = {<>},
              journaltitle = {<>},
              title        = {<>},
              doi          = {<>},
              number       = {<>},
              pages        = {<>},
              volume       = {<>},
            }
            ]],
            {
                i(1, "Citation key"),
                i(2, "Author(s)"),
                i(3, "Publication date"),
                i(4, "Title of journal"),
                i(5, "Title of article"),
                i(6, "DOI of the article"),
                i(7, "Number/subvolume"),
                i(8, "Pages inside the volume"),
                i(9, "Journal volume"),
            }
        )
    ),

    s(
        {
            trig = "book",
            dscr = "Book entry in bibliography",
        },
        fmta(
            [[
            @Book{<>
              author    = {<>},
              date      = {<>},
              title     = {<>},
              doi       = {<>},
              isbn      = {<>},
              publisher = {<>},
            }
            ]],
            {
                i(1, "Citation key"),
                i(2, "Author(s)"),
                i(3, "Publication date"),
                i(4, "Title of the book"),
                i(5, "DOI"),
                i(6, "ISBN"),
                i(7, "Publisher"),
            }
        )
    ),

    s(
        {
            trig = "inpr",
            dscr = "Article inside of conference proceedings",
        },
        fmta(
            [[
            @InProceedings{<>,
              author   = {<>},
              title    = {<>},
              doi      = {<>},
              pages    = {<>},
              crossref = {<>},
            }
            ]],
            {
                i(1, "Citation key"),
                i(2, "Author(s)"),
                i(3, "Title of the article"),
                i(4, "DOI"),
                i(5, "Pages inside the proceedings volume"),
                i(6, "Citation key of proceedings"),
            }
        )
    ),

    s(
        {
            trig = "proc",
            dscr = "Entire volume of conference proceedings",
        },
        fmta(
            [[
            @Proceedings{<>,
              date      = {<>},
              title     = {<>}, 
              doi       = {<>},
              editor    = {<>}, 
              eventdate = {<>}, 
              isbn      = {<>},
              number    = {<>},
              series    = {<>},
              venue     = {<>},
            }
            ]],
            {
                i(1, "Citation key"),
                i(2, "Publication date"),
                i(3, "Title of the proceedings volume"),
                i(4, "DOI"),
                i(5, "Editor"),
                i(6, "Date of the conference"),
                i(7, "ISBN of the volume"),
                i(8, "Number inside the series"),
                i(9, "Series of the volume"),
                i(10, "Venue of the conference"),
            }
        )
    )
}
