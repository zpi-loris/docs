#import "@local/zpi_report:0.1.1": zpi_report
#show: zpi_report.with(
  title: [Bezprzewodowy system IoT do monitoringu \ parametrów środowiskowych i
    nadzoru \ upraw rolniczych  bazujących na technologii LoRa],
  acronym: "loris",
  edition: "2026",
  project_logo: image("./assets/loris_logo.png", width: 2cm),
  zpi_logo: image("./assets/ZPI-Day-cmyk.pdf", width: 2cm),
  lang: "pl",
  abstract: [],
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

= Wstęp

Nadzór i automatyzacja upraw rolniczych wymagają stałego dostępu do danych z
terenu, takich jak wilgotność gleby, temperatura czy stan urządzeń
nawadniających. Pola zajmują jednak rozległe obszary, na których zwykle nie ma
ani infrastruktury sieciowej, ani zasilania. W efekcie kontrola upraw często
opiera się na osobistej inspekcji terenu, co pochłania czas i środki, a reakcja
na zmiany warunków bywa spóźniona.

Popularne technologie bezprzewodowe nie rozwiązują tego problemu w pełni. Wi-Fi
i Bluetooth mają zasięg ograniczony do kilkudziesięciu metrów, a sieci
komórkowe wymagają abonamentu i zużywają więcej energii, co utrudnia zasilanie
urządzeń z baterii lub niewielkiego panelu słonecznego. Odpowiedzią na te
ograniczenia jest modulacja LoRa, która umożliwia przesyłanie niewielkich
ilości danych na duże odległości przy bardzo niskim poborze energii. Na jej
bazie powstał protokół LoRaWAN, opisujący całą ścieżkę komunikacji: od
urządzeń końcowych, przez bramki, aż po serwer sieciowy i aplikację kliencką.

Celem projektu było opracowanie systemu opartego na LoRaWAN i otwartym
oprogramowaniu, który:
- umożliwi monitorowanie i sterowanie urządzeniami na dystansie ok. 3 km w
  obszarze niezabudowanym, co pozwoli na automatyzację części pracy wykonywanej
  przez rolnika,
- urządzenia końcowe będą działać przy niskim zużyciu energii, co pozwoli na
  wdrożenie ich na obszarach bez zasilania sieciowego,
- będzie niezależne od typu urządzeń końcowych, co pozwoli na wykorzystanie go
  także poza rolnictwem.


= Test

#lorem(30)

== Test test

#lorem(20)

== Test test 2

#lorem(20)

// Add bibliography and create Bibiliography section
#bibliography("bibliography.bib", full: true)


