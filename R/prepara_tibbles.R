# Pacotes ----------------------------------------------------------------------

library(tidyverse)
library(sf)
library(janitor)
library(spcrimr)

# SEADE ------------------------------------------------------------------------
seade <-
  seade_completa %>%
  filter(ano >= 2002 & ano <= 2017) %>%
  unnest() %>%
  mutate(municipio = nm_municip_ascii) %>%
  select(chave, municipio, nome_localidade_pai, everything(),
         -nm_municip_ascii, -unidade, -codigo_localidade, -periodo)

#usethis::use_data(seade, overwrite = T)

# SSP --------------------------------------------------------------------------
ssp_ocorrencias_crimes <-
  ssp_ocorrencias_crimes %>%
  group_by(ano) %>%
  nest()

ssp_ocorrencias_crimes$data <-
  ssp_ocorrencias_crimes %>%
  select(ano) %>%
  insert_munic_idx(.) %>%
  map2(., ssp_ocorrencias_crimes$data, ~ mutate(.y, chave = .x))

ssp_ocorrencias_crimes %>%
  unnest() %>%
  select(chave, municipio, everything()) -> ssp_ocorrencias_crimes

#usethis::use_data(ssp_ocorrencias_crimes, overwrite = T)

ssp_produtividade_policial <-
  ssp_produtividade_policial %>%
  group_by(ano) %>%
  nest()

ssp_produtividade_policial$data <-
  ssp_produtividade_policial %>%
  select(ano) %>%
  insert_munic_idx(.) %>%
  map2(., ssp_produtividade_policial$data, ~ mutate(.y, chave = .x))

ssp_produtividade_policial %>%
  unnest() %>%
  select(chave, municipio, everything()) -> ssp_produtividade_policial

#usethis::use_data(ssp_produtividade_policial, overwrite = T)

# IBGE SHP ---------------------------------------------------------------------
#o mapa
sf_sampa <-
  read_sf("~/[documentos]Raul/R[scripts]/SHP/shp/sp/35MUE250GC_SIR.shp") %>%
  clean_names() %>%
  mutate(cod_ibge = as.integer(paste0(cd_geocmu))) %>%
  select(-cd_geocmu) %>%
  arrange(nm_municip) %>%
  mutate(municipio = abjutils::rm_accent(nm_municip)) %>%
  arrange(nm_municip) %>%
  mutate(chave = seq(645)) %>%
  select(nm_municip, municipio, cod_ibge, chave)

