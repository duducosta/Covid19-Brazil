# Covid19-Brazil
Scripts em R para análise de dados e geração de gráficos à partir dos dados de https://covid.saude.gov.br/

# Origem dos dados
Os dados são retirados do site [https://covid.saude.gov.br/](https://covid.saude.gov.br/), através de arquivo `.csv` disponibilizado diariamente.  
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
Pode ser usado a busca do navegador para facilitar.  

__Casos totais-AC__

![](/TC/AC-TC-Completo.jpeg)
![](/TC/AC-Vel_semanal.jpeg)

__Casos totais-AL__

![](/TC/AL-TC-Completo.jpeg)
![](/TC/AL-Vel_semanal.jpeg)

__Casos totais-AM__

![](/TC/AM-TC-Completo.jpeg)
![](/TC/AM-Vel_semanal.jpeg)

__Casos totais-AP__

![](/TC/AP-TC-Completo.jpeg)
![](/TC/AP-Vel_semanal.jpeg)

__Casos totais-BA__

![](/TC/BA-TC-Completo.jpeg)
![](/TC/BA-Vel_semanal.jpeg)

__Casos totais-CE__

![](/TC/CE-TC-Completo.jpeg)
![](/TC/CE-Vel_semanal.jpeg)

__Casos totais-DF__

![](/TC/DF-TC-Completo.jpeg)
![](/TC/DF-Vel_semanal.jpeg)

__Casos totais-ES__

![](/TC/ES-TC-Completo.jpeg)
![](/TC/ES-Vel_semanal.jpeg)

__Casos totais-GO__

![](/TC/GO-TC-Completo.jpeg)
![](/TC/GO-Vel_semanal.jpeg)

__Casos totais-MA__

![](/TC/MA-TC-Completo.jpeg)
![](/TC/MA-Vel_semanal.jpeg)

__Casos totais-MG__

![](/TC/MG-TC-Completo.jpeg)
![](/TC/MG-Vel_semanal.jpeg)

__Casos totais-MS__

![](/TC/MS-TC-Completo.jpeg)
![](/TC/MS-Vel_semanal.jpeg)

__Casos totais-MT__

![](/TC/MT-TC-Completo.jpeg)
![](/TC/MT-Vel_semanal.jpeg)

__Casos totais-PA__

![](/TC/PA-TC-Completo.jpeg)
![](/TC/PA-Vel_semanal.jpeg)

__Casos totais-PB__

![](/TC/PB-TC-Completo.jpeg)
![](/TC/PB-Vel_semanal.jpeg)

__Casos totais-PE__

![](/TC/PE-TC-Completo.jpeg)
![](/TC/PE-Vel_semanal.jpeg)

__Casos totais-PI__

![](/TC/PI-TC-Completo.jpeg)
![](/TC/PI-Vel_semanal.jpeg)

__Casos totais-PR__

![](/TC/PR-TC-Completo.jpeg)
![](/TC/PR-Vel_semanal.jpeg)

__Casos totais-RJ__

![](/TC/RJ-TC-Completo.jpeg)
![](/TC/RJ-Vel_semanal.jpeg)

__Casos totais-RN__

![](/TC/RN-TC-Completo.jpeg)
![](/TC/RN-Vel_semanal.jpeg)

__Casos totais-RO__

![](/TC/RO-TC-Completo.jpeg)
![](/TC/RO-Vel_semanal.jpeg)

__Casos totais-RR__

![](/TC/RR-TC-Completo.jpeg)
![](/TC/RR-Vel_semanal.jpeg)

__Casos totais-RS__

![](/TC/RS-TC-Completo.jpeg)
![](/TC/RS-Vel_semanal.jpeg)

__Casos totais-SC__

![](/TC/SC-TC-Completo.jpeg)
![](/TC/SC-Vel_semanal.jpeg)

__Casos totais-SE__

![](/TC/SE-TC-Completo.jpeg)
![](/TC/SE-Vel_semanal.jpeg)

__Casos totais-SP__

![](/TC/SP-TC-Completo.jpeg)
![](/TC/SP-Vel_semanal.jpeg)

__Casos totais-TO__

![](/TC/TO-TC-Completo.jpeg)
![](/TC/TO-Vel_semanal.jpeg)
















## Recursos usados
* [liguagem R](https://cran.r-project.org/)
* [R Studio](https://www.rstudio.com/)
* [Ministério da saúde e SVS](https://covid.saude.gov.br/)

## Método de atualização
1. Baixar arquivo `.csv`
2. Atualizar script 'data import.R' para buscar último arquivo baixado
3. Rodar demais scripts
