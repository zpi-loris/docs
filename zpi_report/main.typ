#import "@local/zpi_report:0.1.1": zpi_report
#show: zpi_report.with(
  title: [Bezprzewodowy system IoT do monitoringu \ parametrów środowiskowych i
    nadzoru \ upraw rolniczych  bazujących na technologii LoRa],
  acronym: "loris",
  edition: "2026",
  project_logo: image("./assets/loris_logo.png", width: 2cm),
  zpi_logo: image("./assets/ZPI-Day-cmyk.pdf", width: 2cm),
  lang: "pl",
  abstract: [Jednym z głównych problemów nadzoru i automatyzacji upraw
    rolniczych jest ograniczona możliwość komunikacji oraz brak dostępu do
    zasilania na rozległych połaciach terenu. Problem ten można rozwiązać z
    wykorzystaniem nowoczesnych technologii, opartych na technice modulacji LoRa,
    która niewielkim kosztem energetycznym potrafi przesyłać dane na dalekie
    dystanse. W tym celu wytworzyliśmy gotowy do użytku system, obejmujący swym
    zakresem cały proces komunikacji LoRa: od urządzeń końcowych, przez bramki,
    serwer, aż po klienta oraz jego interfejs. Efektem jest możliwość nadzoru
    upraw rolniczych na odległych dystansach oraz dokonywanie automatyzacji.
    System jest dowolnie rozbudowywalny oraz agnostyczny względem urządzeń
    końcowych , co pozwala na jego wykorzystanie w rozmaitych obszarach - nie
    tylko w rolnictwie.],
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

= Wprowadzenie

= Test

#lorem(30)

== Test test

#lorem(20)

== Test test 2

#lorem(20)

// Add bibliography and create Bibiliography section
#bibliography("bibliography.bib", full: true)


