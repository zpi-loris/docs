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
  supervisor: "Piotr Jóźwiak",
)
#set cite(style: "gb-7714-2015-numeric")
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


= Prace związane z tematem
Dostępne na rynku systemy zdalnej rozproszonej automatyki opierają się w
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
Protokół LoRaWAN w Europie wykorzystuje nielicencjonowane pasmo radiowe 868
MHz@lorawan_spec, którego wykorzystanie jest prawnie znacząco ograniczone. Z
tego powodu w projekcie wykorzystano format wymiany danych _Protocol Buffers_,
który pozwala na efektywną serializację wiadomości strukturalnych
@viotti2022benchmark, aby zmaksymalizować wydajność systemu i zminimalizować
czas transmisji.

Założono zasięg transmisji do 3 km na terenie otwartym przy braku dostępu do
sieci energetycznej -- urządzenia końcowe mogą wykorzystywać tryby głębokiego
uśpienia oraz być przez długi czas zasilane bateryjnie.

System jest otwarty i pozwala na jego proste rozbudowywanie oraz wytwarzanie i
dodawanie urządzeń końcowych dostosowanych do konkretnych potrzeb użytkowników.

= Rezultaty
W projekcie udało zrealizować się wszystkie planowane funkcjonalności systemu.

== Urządzenia końcowe
W ramach projektu wytworzony został framework do tworzenia oprogramowania dla
urządzeń końcowych zgodnego z pełnym systemem _loris_. Framework oparty jest na
systemie operacyjnym czasu rzeczywistego Zephyr.

=== Przykłady urządzeń końcowych
Aby w pełni przetestować wdrożenie projektu, przygotowane zostały trzy
przykładowe jednostki końcowe. Demonstrują one najważniejsze możliwości systemu
oraz ogólny sposób integracji urządzeń z jego pozostałymi elementami. Do każdej
z nich wykonane zostały schematy elektroniczne oraz przykładowe aplikacje w
systemie Zephyr, dzięki czemu mogą również służyć jako wzorce wytwarzania
własnych urządzeń dla potencjalnych użytkowników systemu.

==== Monitor roślin
Celem tego urządzenia jest monitorowanie parametrów środowiskowych roślin, aby
na ich podstawie system mógł podejmować decyzje, jak np. automatyzacja
podlewania.

#align(center)[
  #figure(supplement: [Rysunek], caption: [Schemat elektroniczny monitora
    roślin])[
    #image("assets/plant_monitor_schematic.pdf")
  ]
]

Urządzenie udostępnia dane z następujących podzespołów:
- czujnika temperatury otoczenia,
- sondy temperatury gleby,
- czujnika wilgotności gleby.

Dodatkowo, układ zapewnia poniższe elementy wykonawcze, które mogą być sterowane
przez serwer automatyzacji i służyć m.in. do alarmowania wizualnego i
dźwiękowego:
- LEDy w kolorach: zielonym, żółtym i czerwonym,
- brzęczek.

W celu zabezpieczenia urządzenia została również wytworzona obudowa w technologii druku 3D.
#align(center)[
  #figure(
    supplement: [Rysunek],
    caption: [Układ monitora (po lewej); w obudowie (po prawej)],
  )[
    #columns(2)[
      #image("assets/placeholder.svg")
      #colbreak()
      #image("assets/placeholder.svg")
    ]
  ]
]

==== Irygator roślin
Główną odpowiedzialnością tego urządzenia jest irygacja roślin za pomocą pompy
perystaltycznej w sposób zautomatyzowany przez system. Jego praca jest ściśle
powiązana z monitorem roślin -- na podstawie mierzonych przez niego warunków
środowiskowych silnik automatyzacji podejmuje decyzje o podlewaniu.

#align(center)[
  #figure(
    supplement: [Rysunek],
    caption: [Schemat elektroniczny irygatora roślin],
  )[
    #image("assets/plant_irrigator_schematic.pdf")
  ]
]

Układ nie udostępnia żadnych danych, a jedynie zapewnia możliwość uruchomienia
pompy perystaltycznej na określony czas. Do urządzenia, podobnie jak w przypadku
monitora, również została zaprojektowana obudowa.

#align(center)[
  #figure(
    supplement: [Rysunek],
    caption: [Układ irygatora (po lewej); w obudowie (po prawej)],
  )[
    #columns(2)[
      #image("assets/placeholder.svg")
      #colbreak()
      #image("assets/placeholder.svg")
    ]
  ]
]

== Bramka LoRaWAN
Jednym z kluczowych elementów zaprojektowanym w ramach projektu jest bramka
LoRaWAN oparta na otwartoźródłowym oprogramowaniu ChirpStack działająca na
komputerze jednopłytkowym RaspberryPi 5. Aby umożliwić pracę z technologią radiową LoRa do
komputera dołączony został moduł WM1302 firmy Seeed Studio oparty na chipie
Semtech SX1302.

Do obsługi bramki zostały wytworzone obrazy Docker oraz skrypty wdrażające, aby
umożlwić szybkie i powtarzalne uruchamianie pełnego środowiska bramki, na które
składa się przede wszystkim oprogramowanie ChirpStack MQTT Forwarder oraz
ChirpStack Concentratord@chirpstack_docs.

Dodatkowo, w celach wdrożeniowych, została zaprojektowana i wydrukowana w
technologii 3D obudowa do komputera bramki. Autorski projekt uwzględnia potrzeby
komunikacji radiowej LoRa oraz systemu GPS wykorzystywanego przez
LoRaWAN@lorawan_spec.

#align(center)[
  #figure(supplement: [Rysunek], caption: [Wytworzona obudowa komputera
    bramki])[
    #image("assets/placeholder.svg", width: 50%)
  ]
]

// TODO: wymyślić lepszą nazwę
== Aplikacja


#bibliography("bibliography.bib", full: true)


