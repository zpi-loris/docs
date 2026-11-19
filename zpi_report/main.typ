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

= Prace związane z tematem
Dostępne na rynku systemy zdalnej rozproszonej automatyki, takie jak popularne
otwartoźródłowe i wolne oprogramowanie o nazwie _Home Assistant_ opierają się w
większości na technologiach krótkodystansowych (np. Bluetooth LE, ZigBee) lub
energochłonnych (np. 5G, WiFi), które do działania wymagają odpowiedniej
infrastruktury i stałego źródła zasilania. Rozwiązaniem umożliwiającym
połączenie energooszczędności z długodystansowym transferem danych jest
technologia radiowa LoRa oraz oparty na niej protokół komunikacyjny LoRaWAN.
Alternatywne technologie LPWAN (ang. _Low-Power Wide-Area Network_), jak np.
NB-IoT i LTE-M wymagają stałych opłat abonamentowych, ponieważ oparte są na
sieci komórkowej. Z kolei komercyjne platformy automatyzacji dla rolnictwa (np.
_iMETOS_, _Libelium_) to rozwiązania drogie, zamknięte i skupione na pasywnej
telemetrii.

Projekt _loris_ wyróżnia się na tle istniejących rozwiązań połączeniem
niskokosztowej, otwartej architektury opartej na LoRaWAN z dwukierunkową
automatyką opartą na silniku reguł sterowanym zdarzeniami. System umożliwia
zdalne sterowanie elementami wykonawczymi, np.: jazami, śluzami, elektrozaworami
i pompami, w oparciu o zbierane dane.

== Główne założenia i ograniczenia projektowe
=== Komunikacja i regulacje prawne
Protokół LoRaWAN w Europie wykorzystuje nielicencjonowane pasmo radiowe 868 MHz,
którego wykorzystanie jest prawnie znacząco ograniczone. Z tego powodu w
projekcie wykorzystano format wymiany danych _Protocol Buffers_, który pozwala
na efektywną serializację wiadomości strukturalnych @viotti2022benchmark, aby
zmaksymalizować wydajność systemu i zminimalizować czas transmisji.
=== Zasilanie i zasięg
Założono zasięg transmisji do 3 km na terenie otwartym przy braku dostępu do
sieci energetycznej -- urządzenia końcowe mogą wykorzystywać tryby głębokiego
uśpienia oraz być przez długi czas zasilane bateryjnie.
=== Otwartość
System jest otwarty i pozwala na jego proste rozbudowywanie oraz wytwarzanie i
dodawanie urządzeń końcowych dostosowanych do konkretnych potrzeb użytkowników.

#bibliography("bibliography.bib", full: true)


