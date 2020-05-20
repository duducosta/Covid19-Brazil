## DADOS POR ESTADOS 
# 0 Preparação do arquivo
origem <- "https://covid.saude.gov.br/"
setwd("D:\\Projects\\Data Analysis\\Covid19 - Brazil")
getwd()
library("tidyverse")
library("ggplot2")
library("treemap")
library("lubridate")
library("signal")
library("grid")
library("gridBase")
library("gridExtra")
library("viridis")
Sys.setlocale("LC_TIME", "English")
conflicts() #Existem conflitos entre funções dos pacotes. Usar "::" para determinar qual namespace usar
tidyverse_conflicts()
options(scipen=999)

# 1 Importação dos dados
# Arquivo .csv do site: https://covid.saude.gov.br/
#importação
MyData <- read.csv("db\\HIST_PAINEL_COVIDBR_20200519.csv", sep = ";")
colnames(MyData) <- c("regiao","estado","municipio","coduf","codmun","codRegiaoSaude","nomeRegiaoSaude","data","semanaEpi","populacaoTCU2019","casosAcumulado","obitosAcumulado","Recuperadosnovos","emAcompanhamentoNovos")
#atribuição de fatores e formatos
MyData[MyData==""] <- NA
MyData$regiao <-factor(MyData$regiao)
MyData$estado <-factor(MyData$estado)
MyData$municipio <-factor(MyData$municipio)
MyData$nomeRegiaoSaude <-factor(MyData$nomeRegiaoSaude)
MyData$data <- as.POSIXct(MyData$data, format="%Y-%m-%d", tz="UTC")
last_update <- max(MyData$data)
#Construindo dataframe por estado
df_temp <- MyData[MyData$regiao !="Brasil" & is.na(MyData$municipio) & is.na(MyData$codmun),]
df_estados <- data.frame(uf=df_temp$estado,
                 cases=df_temp$casosAcumulado,
                 deaths=df_temp$obitosAcumulado,
                 datetime=df_temp$data,
                 week=df_temp$semanaEpi)
remove(df_temp)


# Importação do controle de semana completas
weeks_complete <-read.csv("week_complete.csv", sep = ";")

### FINAL DO ARQUIVO DE IMPORTAÇÃO
setwd("D:\\Projects\\Data Analysis\\Covid19 - Brazil")
print("----------------FINAL DO ARQUIVO DE IMPORTAÇÃO------------------")
