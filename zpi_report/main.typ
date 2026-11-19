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
    która niewielkim kosztem energetycznym pozwala na przesyłanie danych na
    dalekie dystanse. W tym celu, wspierając się otwartym oprogramowaniem,
    wytworzyliśmy gotowy do użytku system, obejmujący swym zakresem pełną ścieżkę
    komunikacji w standardzie LoRaWAN: od urządzeń końcowych, przez bramki,
    serwer, aż po aplikację kliencką oraz jej interfejs. Efektem wytworzonego
    systemu jest udostępnienie możliwości monitorowania oraz automatyzacji na
    dużych dystansach (ok. 3 km), co pozwala na efektywniejszą kontrolę nad
    uprawami oraz oszczędność czasu i środków. System jest otwarty oraz
    agnostyczny względem urządzeń końcowych, co pozwala na jego wykorzystanie w
    rozmaitych obszarach - nie tylko w rolnictwie.],
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


