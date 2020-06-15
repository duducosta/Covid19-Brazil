# Origem dos dados
Os dados são retirados do site [https://covid.saude.gov.br/](https://covid.saude.gov.br/), através de arquivo `.csv` disponibilizado diariamente.  
Infelizmente atualmente somente as informações de casos acumulados e mortes são divulgadas periodicamente e de forma estruturada.  
Explicações detalhadas de cada campo podem ser obtidas no mesmo site, assim como a limitação dos mesmos.
Arquivos shapefile (geográficos) retirados do site do [IBGE](ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/Brasil/BR/)

# Gráficos e tabelas
Estas figuras são feitas a partir dos dados fornecidos pelo ministério da saúde.  
A linha é a evolução dos casos com base diária, ou no intervalo de tempo entre disponibilização dos arquivos.  
As colunas são coloridas com base na INCLINAÇÃO da reta tangente à curva do gráfico, com base semanal e após tratar os dados por um filtro de Savitzky-Golay, usando-se o [pacote signal](https://cran.r-project.org/web/packages/signal/signal.pdf) com o método `sgolay` com parâmetros: n=15 e p=5.  
Ou seja: Quando mais escura a cor das colunas, mais rápido estão se multiplicando os casos.  

Nota: Dadas as unidades dos gráficos, os mesmos não se encontram em escala, e para o cálculo da inclinação da reta tangente foi usado um fator na escala do gráfico para que os resultados sejam mais sensíveis.




## Recursos usados
* [liguagem R](https://cran.r-project.org/)
* [R Studio](https://www.rstudio.com/)
* [Ministério da saúde e SVS](https://covid.saude.gov.br/)
* [Shape files do IBGE](ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/Brasil/BR/)

## Método de atualização
1. Baixar arquivo `.csv`
2. Atualizar script 'data import.R' para buscar último arquivo baixado
3. Rodar demais scripts
