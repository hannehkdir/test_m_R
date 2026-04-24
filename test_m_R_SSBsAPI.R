# Norske bokstaver.
Sys.setlocale(locale = 'no_NB.utf8')

library(dplyr)
library(tidyr)
install.packages("PxWebApiData")
library(PxWebApiData)

# Se funksjonene i pakka.
ls("package:PxWebApiData")


# For å hente ut fra SSBs database må variablene defineres. Så på metadata for å finne navn på variablene i tabellen.  
# Får en feilmelding,men den gir meg variabelnavnene. Bruk bare T i kode, men den står for TRUE. 
x <- PxWebApiData::ApiData(
  12425,
  ContentsCode = TRUE,
  verbose = T
)

# For å hente ut fra SSBs database må variablene defineres. Så på metadata for å finne navn på variablene i tabellen. Finner variabelnavnene under $id.

PxWebApiData::meta_data(12425)

arbstyrkstatus <- ApiData(
  12425,
  Kjonn = T,
  Alder = T,
  UtdNivaa = T,
  InnvandrKat = T,
  HovArbStyrkStatus = T,
  ContentsCode = T,
  Tid = T
)

# Gir info om datasettet. Det samme kommer opp ved å trykke på blå pil i miljøvinduet.
names(arbstyrkstatus)
str(arbstyrkstatus)
glimpse(arbstyrkstatus)

# Det er to elementer i innlasting så bruk $ for å se på datasett.
# Eller trykk på området i miljøvindu ved siden av (blå pil og)navn på datasett, som tilsvarer kode View (med stor bokstav).
# View åpner en fane i skript-vinduet. Når du står i vindu for visningen, kan du trykke på to funksjoner som vises til høyre i linja.
# Du slippe da å skrive inn koden med navn på datasett (som er veldig langt for det med norsk tekst).
summary(arbstyrkstatus$dataset)
summary(arbstyrkstatus$dataset$HovArbStyrkStatus)
colnames(arbstyrkstatus$dataset)
View(arbstyrkstatus)

# Opprett ett nytt datasett med kortere navn og slett det gamle. 
arbstyrkstatus$dataNOR <- arbstyrkstatus$`12425: Bosatte personer 30-61 år, etter kjønn, alder, utdanningsnivå, innvandringskategori, prioritert arbeidsstyrkestatus, statistikkvariabel og år`
arbstyrkstatus$`12425: Bosatte personer 30-61 år, etter kjønn, alder, utdanningsnivå, innvandringskategori, prioritert arbeidsstyrkestatus, statistikkvariabel og år` <- NULL


# Se på variabelkategoriene, og eventuelt arrangere visning.
distinct(arbstyrkstatus$dataNOR, innvandringskategori)
distinct(arbstyrkstatus$dataNOR, kjønn, innvandringskategori) %>% arrange(kjønn, innvandringskategori)


View(arbstyrkstatus$dataNOR)