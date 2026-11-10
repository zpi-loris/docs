#import "@local/zpi_report:0.1.1": zpi_report
#show: zpi_report.with(
  title: [Bezprzewodowy system IoT do monitoringu \ parametrów środowiskowych i
    nadzoru \ upraw rolniczych  bazujących na technologii LoRa],
  acronym: "loris",
  edition: "2026",
  project_logo: image("./assets/loris_logo.png", width: 2cm),
  zpi_logo: image("./assets/ZPI-Day-cmyk.pdf", width: 2cm),
  lang: "pl",
  abstract: [#lorem(50)],
  authors: (
    "Wojciech Burda",
    "Tomasz Gadziński",
    "Jan Kubów",
    "Karol Wołkowski",
  ),
  supervisor: "dr inż. Piotr Jóźwiak",
)
#set cite(style: "chicago-author-date")
#show link: underline


= Test

#lorem(30)

== Test test

#lorem(20)

== Test test 2

#lorem(20)

// Add bibliography and create Bibiliography section
#bibliography("bibliography.bib", full: true)


