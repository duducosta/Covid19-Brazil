# Covid19-Brazil
Scripts em R para análise de dados e geração de gráficos à partir dos dados de https://covid.saude.gov.br/

# Origem dos dados
Os dados são retirados do site [https://covid.saude.gov.br/](https://covid.saude.gov.br/), através de arquivo `.csv>` disponibilizado diariamente.
Infelizmente atualmente somente as informações de casos acumulados e mortes são divulgadas periodicamente e de forma estruturada.
Explicações detalhadas de cada campo podem ser obtidas no mesmo site, assim como a limitação dos mesmos.

# Gráficos
Estes gráficos são feitos a partirs dos dados fornecidos pelo ministério da saúde.
A linha é a evolução dos casos com base diária, ou no intervalo de tempo entre disponibilização dos arquivos.
As colunas são coloridas com base na INCLINAÇÃO da reta tangente à curva do gráfico, com base semanal e após tratar os dados por um filtro de Savitzky-Golay, usando-se o [pacote signal](https://cran.r-project.org/web/packages/signal/signal.pdf) com o método `sgolay` com parâmetros: n=15 e p=5.
Ou seja: Quando mais escura a cor das colunas, mais rápido estão se multiplicando os casos.
Nota: Dadas as unidades dos gráficos, os mesmos não se encontram em escala, e para o cálculo da inclinação da reta tangente foi usado um fator na escala do gráfico para que os resultados sejam mais sensíveis.

## Gráficos no nível dos estados
Estados em ordem alfabética. 
POde ser usado a busca do navegador para facilitar.

__* Casos totais - AC__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AC -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AC -Vel_semanal.jpeg"></p>
__* Casos totais - AL__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AL -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AL -Vel_semanal.jpeg"></p>
__* Casos totais - AM__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AM -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AM -Vel_semanal.jpeg"></p>
__* Casos totais - AP__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AP -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AP -Vel_semanal.jpeg"></p>
__* Casos totais - BA__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/BA -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/BA -Vel_semanal.jpeg"></p>
__* Casos totais - CE__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/CE -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/CE -Vel_semanal.jpeg"></p>
__* Casos totais - DF__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/DF -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/DF -Vel_semanal.jpeg"></p>
__* Casos totais - ES__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/ES -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/ES -Vel_semanal.jpeg"></p>
__* Casos totais - GO__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/GO -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/GO -Vel_semanal.jpeg"></p>
__* Casos totais - MA__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MA -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MA -Vel_semanal.jpeg"></p>
__* Casos totais - MG__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MG -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MG -Vel_semanal.jpeg"></p>
__* Casos totais - MS__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MS -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MS -Vel_semanal.jpeg"></p>
__* Casos totais - MT__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MT -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MT -Vel_semanal.jpeg"></p>
__* Casos totais - PA__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PA -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PA -Vel_semanal.jpeg"></p>
__* Casos totais - PB__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PB -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PB -Vel_semanal.jpeg"></p>
__* Casos totais - PE__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PE -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PE -Vel_semanal.jpeg"></p>
__* Casos totais - PI__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PI -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PI -Vel_semanal.jpeg"></p>
__* Casos totais - PR__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PR -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PR -Vel_semanal.jpeg"></p>
__* Casos totais - RJ__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RJ -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RJ -Vel_semanal.jpeg"></p>
__* Casos totais - RN__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RN -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RN -Vel_semanal.jpeg"></p>
__* Casos totais - RO__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RO -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RO -Vel_semanal.jpeg"></p>
__* Casos totais - RR__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RR -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RR -Vel_semanal.jpeg"></p>
__* Casos totais - RS__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RS -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RS -Vel_semanal.jpeg"></p>
__* Casos totais - SC__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SC -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SC -Vel_semanal.jpeg"></p>
__* Casos totais - SE__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SE -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SE -Vel_semanal.jpeg"></p>
__* Casos totais - SP__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SP -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SP -Vel_semanal.jpeg"></p>
__* Casos totais - TO__
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/TO -TC-Completo.jpeg"></p>
<p align="center"><img width="500" height="500" src="https://github.com/duducosta/Covid19-Brazil/blob/master/TC/TO -Vel_semanal.jpeg"></p>











## Recursos usados
* [liguagem R](https://cran.r-project.org/)
* [R Studio](https://www.rstudio.com/)
* [Ministério da saúde e SVS](https://covid.saude.gov.br/)

## Método de atualização
1. Baixar arquivo `.csv`
2. Atualizar script 'data import.R' para buscar último arquivo baixado
3. Rodar demais scripts
