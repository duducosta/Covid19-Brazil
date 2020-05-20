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

__Casostotais-AC__

![Casostotais-AC](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AC-TC-Completo.jpeg)
![Casostotais-AC-tab](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AC-Vel_semanal.jpeg)

__Casostotais-AL__

![Casostotais-AL](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AL-TC-Completo.jpeg)
![Casostotais-AL](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AL-Vel_semanal.jpeg)

__Casostotais-AM__

![Casostotais-AM](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AM-TC-Completo.jpeg)
![Casostotais-AM](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AM-Vel_semanal.jpeg)

__Casostotais-AP__

![Casostotais-AP](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AP-TC-Completo.jpeg)
![Casostotais-AP](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/AP-Vel_semanal.jpeg)

__Casostotais-BA__

![Casostotais-BA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/BA-TC-Completo.jpeg)
![Casostotais-BA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/BA-Vel_semanal.jpeg)

__Casostotais-CE__

![Casostotais-CE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/CE-TC-Completo.jpeg)
![Casostotais-CE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/CE-Vel_semanal.jpeg)

__Casostotais-DF__

![Casostotais-DF](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/DF-TC-Completo.jpeg)
![Casostotais-DF](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/DF-Vel_semanal.jpeg)

__Casostotais-ES__

![Casostotais-ES](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/ES-TC-Completo.jpeg)
![Casostotais-ES](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/ES-Vel_semanal.jpeg)

__Casostotais-GO__

![Casostotais-GO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/GO-TC-Completo.jpeg)
![Casostotais-GO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/GO-Vel_semanal.jpeg)

__Casostotais-MA__

![Casostotais-MA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MA-TC-Completo.jpeg)
![Casostotais-MA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MA-Vel_semanal.jpeg)

__Casostotais-MG__

![Casostotais-MG](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MG-TC-Completo.jpeg)
![Casostotais-MG](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MG-Vel_semanal.jpeg)

__Casostotais-MS__

![Casostotais-MS](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MS-TC-Completo.jpeg)
![Casostotais-MS](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MS-Vel_semanal.jpeg)

__Casostotais-MT__

![Casostotais-MT](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MT-TC-Completo.jpeg)
![Casostotais-MT](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/MT-Vel_semanal.jpeg)

__Casostotais-PA__

![Casostotais-PA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PA-TC-Completo.jpeg)
![Casostotais-PA](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PA-Vel_semanal.jpeg)

__Casostotais-PB__

![Casostotais-PB](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PB-TC-Completo.jpeg)
![Casostotais-PB](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PB-Vel_semanal.jpeg)

__Casostotais-PE__

![Casostotais-PE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PE-TC-Completo.jpeg)
![Casostotais-PE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PE-Vel_semanal.jpeg)

__Casostotais-PI__

![Casostotais-PI](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PI-TC-Completo.jpeg)
![Casostotais-PI](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PI-Vel_semanal.jpeg)

__Casostotais-PR__

![Casostotais-PR](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PR-TC-Completo.jpeg)
![Casostotais-PR](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/PR-Vel_semanal.jpeg)

__Casostotais-RJ__

![Casostotais-RJ](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RJ-TC-Completo.jpeg)
![Casostotais-RJ](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RJ-Vel_semanal.jpeg)

__Casostotais-RN__

![Casostotais-RN](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RN-TC-Completo.jpeg)
![Casostotais-RN](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RN-Vel_semanal.jpeg)

__Casostotais-RO__

![Casostotais-RO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RO-TC-Completo.jpeg)
![Casostotais-RO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RO-Vel_semanal.jpeg)

__Casostotais-RR__

![Casostotais-RR](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RR-TC-Completo.jpeg)
![Casostotais-RR](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RR-Vel_semanal.jpeg)

__Casostotais-RS__

![Casostotais-RS](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RS-TC-Completo.jpeg)
![Casostotais-RS](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/RS-Vel_semanal.jpeg)

__Casostotais-SC__

![Casostotais-SC](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SC-TC-Completo.jpeg)
![Casostotais-SC](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SC-Vel_semanal.jpeg)

__Casostotais-SE__

![Casostotais-SE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SE-TC-Completo.jpeg)
![Casostotais-SE](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SE-Vel_semanal.jpeg)

__Casostotais-SP__

![Casostotais-SP](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SP-TC-Completo.jpeg)
![Casostotais-SP](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/SP-Vel_semanal.jpeg)

__Casostotais-TO__

![Casostotais-TO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/TO-TC-Completo.jpeg)
![Casostotais-TO](https://github.com/duducosta/Covid19-Brazil/blob/master/TC/TO-Vel_semanal.jpeg)















## Recursos usados
* [liguagem R](https://cran.r-project.org/)
* [R Studio](https://www.rstudio.com/)
* [Ministério da saúde e SVS](https://covid.saude.gov.br/)

## Método de atualização
1. Baixar arquivo `.csv`
2. Atualizar script 'data import.R' para buscar último arquivo baixado
3. Rodar demais scripts
