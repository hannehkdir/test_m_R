Sys.setlocale(locale = 'no_NB.utf8')

library(dplyr)
library(tidyr)
install.packages("PxWebApiData")
library(PxWebApiData)

#Se funksjonene i pakken.
ls("package:PxWebApiData")

# For å hente ut fra SSBs database må variablene defineres. Så på metadata for å finne navn på variablene i tabellen. Får en feilmelding, men den gir meg variabelnavnene.
x <- PxWebApiData::ApiData(
  12425,
  ContentsCode = TRUE,
  verbose = TRUE
)


# For å hente ut fra SSBs database må variablene defineres. Så på metadata for å finne navn på variablene i tabellen. Finner variabelnavnene under $id.
PxWebApiData::meta_data(12425)

arbstyrkstatus <- ApiData(
  12425,
  Kjonn = TRUE,
  Alder = TRUE,
  UtdNivaa = TRUE,
  InnvandrKat = TRUE,
  HovArbStyrkStatus = TRUE,
  ContentsCode = TRUE,
  Tid = TRUE
)

names(arbstyrkstatus)
str(arbstyrkstatus)

