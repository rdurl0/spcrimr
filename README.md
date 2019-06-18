
# spcrimr

`spcrimr` is a simple package to download and use tidy data from
Secretaria de Sweegurança Pública, state of Sao Paulo, Brazil.

## Installation

You can install abjMaps from github with:

``` r
# install.packages("devtools")
devtools::install_github("abjur/abjMaps")
```

## Example

### Data

``` r
library(spcrimr)
library(tibble)

ssp_ocorrencias_crimes
#> # A tibble: 10,320 x 22
#>    nm_municip municipio   ano furto_de_veiculo furto_outros
#>    <chr>          <int> <dbl>            <int>        <int>
#>  1 ADAMANTINA         1  2002                0          319
#>  2 ADAMANTINA         1  2003                3          277
#>  3 ADAMANTINA         1  2004                2          420
#>  4 ADAMANTINA         1  2005                6          376
#>  5 ADAMANTINA         1  2006               14          294
#>  6 ADAMANTINA         1  2007                7          327
#>  7 ADAMANTINA         1  2008                5          397
#>  8 ADAMANTINA         1  2009                2          286
#>  9 ADAMANTINA         1  2010                4          227
#> 10 ADAMANTINA         1  2011               10          245
#> # ... with 10,310 more rows, and 17 more variables:
#> #   homicidio_culposo_outros <int>,
#> #   homicidio_culposo_por_acidente_de_transito <int>,
#> #   homicidio_doloso <int>,
#> #   homicidio_doloso_por_acidente_de_transito <int>, latrocinio <int>,
#> #   lesao_corporal_culposa_outras <int>,
#> #   lesao_corporal_culposa_por_acidente_de_transito <int>,
#> #   lesao_corporal_dolosa <int>, roubo_a_banco <int>,
#> #   roubo_de_carga <int>, roubo_de_veiculo <int>,
#> #   tentativa_de_homicidio <int>, total_de_estupro <int>,
#> #   total_de_roubo_outros <int>, vitimas_em_homicidio_doloso <int>,
#> #   vitimas_em_homicidio_doloso_por_acidente_de_transito <int>,
#> #   vitimas_em_latrocinio <int>

ssp_produtividade_policial
#> # A tibble: 10,320 x 16
#>    nm_municip municipio   ano armas_de_fogo_a~ flagrantes_lavr~
#>    <chr>          <int> <dbl>            <int>            <int>
#>  1 ADAMANTINA         1  2002               20               54
#>  2 ADAMANTINA         1  2003               23               58
#>  3 ADAMANTINA         1  2004               16               49
#>  4 ADAMANTINA         1  2005               12               36
#>  5 ADAMANTINA         1  2006               18               43
#>  6 ADAMANTINA         1  2007               12               38
#>  7 ADAMANTINA         1  2008                8               64
#>  8 ADAMANTINA         1  2009                8               44
#>  9 ADAMANTINA         1  2010               18               34
#> 10 ADAMANTINA         1  2011               11               68
#> # ... with 10,310 more rows, and 11 more variables:
#> #   infratores_apreendidos_em_flagrante <int>,
#> #   infratores_apreendidos_por_mandado <int>,
#> #   ocorrências_de_apreensao_de_entorpecentes1 <int>,
#> #   ocorrências_de_porte_de_entorpecentes <int>,
#> #   ocorrências_de_porte_ilegal_de_arma <int>,
#> #   ocorrências_de_tráfico_de_entorpecentes <int>,
#> #   pessoas_presas_em_flagrante <int>, pessoas_presas_por_mandado <int>,
#> #   prisões_efetuadas <int>,
#> #   tot_de_inquéritos_policiais_instaurados <int>,
#> #   veiculos_recuperados <int>

ssp_variables_names
#> # A tibble: 32 x 3
#>    variaveis_tidy               variaveis_raw                dataset       
#>    <chr>                        <chr>                        <chr>         
#>  1 armas_de_fogo_apreendidas    Nº DE ARMAS DE FOGO APREEND~ produtividade~
#>  2 flagrantes_lavrados          Nº DE FLAGRANTES LAVRADOS    produtividade~
#>  3 infratores_apreendidos_em_f~ Nº DE INFRATORES APREENDIDO~ produtividade~
#>  4 infratores_apreendidos_por_~ Nº DE INFRATORES APREENDIDO~ produtividade~
#>  5 ocorrências_de_apreensao_de~ OCORRÊNCIAS DE APREENSÃO DE~ produtividade~
#>  6 ocorrências_de_porte_de_ent~ OCORRÊNCIAS DE PORTE DE ENT~ produtividade~
#>  7 ocorrências_de_porte_ilegal~ OCORRÊNCIAS DE PORTE ILEGAL~ produtividade~
#>  8 ocorrências_de_tráfico_de_e~ OCORRÊNCIAS DE TRÁFICO DE E~ produtividade~
#>  9 pessoas_presas_em_flagrante  Nº DE PESSOAS PRESAS EM FLA~ produtividade~
#> 10 pessoas_presas_por_mandado   Nº DE PESSOAS PRESAS POR MA~ produtividade~
#> # ... with 22 more rows

seade # a database from SEADE
#> # A tibble: 40 x 2
#>      ano data               
#>    <int> <list>             
#>  1  1980 <tibble [645 x 92]>
#>  2  1981 <tibble [645 x 92]>
#>  3  1982 <tibble [645 x 92]>
#>  4  1983 <tibble [645 x 92]>
#>  5  1984 <tibble [645 x 92]>
#>  6  1985 <tibble [645 x 92]>
#>  7  1986 <tibble [645 x 92]>
#>  8  1987 <tibble [645 x 92]>
#>  9  1988 <tibble [645 x 92]>
#> 10  1989 <tibble [645 x 92]>
#> # ... with 30 more rows
```

### Functions

``` r
download_table_sp(ano = 2019,
                  municipio = 500,
                  type = "ctl00$conteudo$btnMensal")
```

``` r
chave_list("a vector")
```

## Citation

To cite `spcrimr`, write `citation("spcrimr")`:

    To cite package ‘spcrimr’ in publications use:
    
      Raul de Sá Durlo (2019). spcrimr: tidy data from SSP-SP.
      R package version 0.0.9000.
    
    A BibTeX entry for LaTeX users is
    
      @Manual{,
        title = {spcrimr: tidy data from SSP-SP},
        author = {Raul de Sá Durlo},
        year = {2019},
        note = {R package version 0.0.9000},
      }
