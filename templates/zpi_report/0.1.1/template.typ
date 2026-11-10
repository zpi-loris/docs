#let orcid(id) = {
  box(height: 0.9em, baseline: 0.1em)[
    #link("https://orcid.org/" + id)[
      #text(fill: rgb("a6ce39"), weight: "bold", size: 0.8em)[ID]
    ]
  ]
}

#let zpi_report(
  title: [],
  acronym: "",
  edition: "2025",
  authors: (),
  supervisor: "",
  project_logo: none,
  zpi_logo: none,
  lang: "pl",
  abstract: none,
  body,
) = {
  set document(
    title: title,
    author: if type(authors) == array {
      authors.map(a => if type(a) == str { a } else { "" })
    } else {
      str(authors)
    },
  )

  set page(
    paper: "a4",
    margin: (top: 1.85cm, left: 2.5cm, right: 2.5cm, bottom: 2cm),
    header-ascent: 5mm,
    header: align(center)[
      #text(size: 10pt, weight: "regular")[ZPI #edition]
      #v(1mm)
      #line(length: 100%, stroke: 1pt + black)
    ],
  )

  set text(font: ("Fira Sans", "DejaVu Sans"), weight: "light", lang: lang, size: 10pt)
  set par(justify: true, first-line-indent: 1.5em, leading: 0.65em)

  set heading(numbering: "1.1")
  show heading.where(level: 1): it => block(width: 100%, above: 1.5em, below: 1em)[
    #set par(first-line-indent: 0pt)
    #text(size: 1.25em, weight: "bold")[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(1em)
      }
      #upper(it.body)
    ]
    #v(0.2em)
    #line(length: 100%, stroke: 0.5pt + black)
  ]

  show heading.where(level: 2): it => block(above: 1.2em, below: 0.8em)[
    #set par(first-line-indent: 0pt)
    #text(size: 1.1em, weight: "bold")[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.8em)
      }
      #it.body
    ]
  ]

  let render_logo(logo) = {
    if logo == none { none } else if type(logo) == content { logo } else if type(logo) == str {
      image(logo, width: 2cm)
    } else { none }
  }

  grid(
    columns: (2cm, 1fr, 2cm),
    align: (center + horizon, center + horizon, center + horizon),
    render_logo(project_logo),
    [
      #text(size: 2em, weight: "bold")[#acronym] \
      #v(2mm)
      #text(size: 1.3em, weight: "bold")[#title]
    ],
    render_logo(zpi_logo),
  )

  v(4pt)
  line(length: 100%, stroke: 0.5pt + black)
  v(0.05em)

  let labels = if lang == "pl" {
    (members: "Autorzy", supervisor: "Opiekun")
  } else {
    (members: "Authors", supervisor: "Supervisor")
  }

  let formatted_authors = if type(authors) == array {
    authors.join([ • ])
  } else {
    authors
  }

  pad(top: 0.2em, bottom: 0.2em)[
    #set text(size: 12pt)
    #stack(
      spacing: 1em,
      [*#labels.members:* #formatted_authors],
      [*#labels.supervisor:* #supervisor],
    )
  ]

  v(2pt)
  line(length: 100%, stroke: 0.5pt + black)
  v(0.2em)

  if abstract != none {
    pad(x: 0.2cm, top: 0.6em, bottom: 0.6em)[
      #set par(first-line-indent: 0pt, justify: true)
      #align(center)[*#if lang == "pl" [Streszczenie] else [Abstract]*]
      #v(0.3em)
      #abstract
    ]
  }

  body
}
