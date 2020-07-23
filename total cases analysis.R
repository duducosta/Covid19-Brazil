setwd(file.path("F:","4 Data Analysis","Covid19-Brazil","TC"))
getwd()
g_width = 800
g_height = 800
# 2 Data visualization and treatment
# 2.1 Gráficos individuais por estado (# y=Casos totais, x=dias)
  # SEM FILTRO / ESCALA CARTESIANA
for(var in unique(df_estados$uf))
{
  p1 <- ggplot(data=df_estados[df_estados$uf == var,]) + 
              geom_line(stat= "identity", 
                       aes(x=datetime, y=cases), size=2, colour="blue")+
              labs(title = paste("Casos totais no estado de",var,"por dia"),
                    subtitle = "",
                    caption = paste("Origem dos dados:",origem,"\n Atualizado em:", last_update,"   -  Autor: Eduardo Costa - duducosta.github.io/Covid19-Brazil/"))+
              xlab("Days") + ylab("Casos totais") +
              theme_light()+
              theme(axis.title = element_text(face="bold",colour="red",size=20),
                      axis.text = element_text(face="bold",size=15),
                    plot.title = element_text(lineheight = 0.8,face="bold",size=30),
                    plot.caption = element_text(lineheight = 0.8,size=15))
  jpeg(paste(var,"-TC-Basico.jpeg",sep=""), width= g_width, height= g_height)
  print(p1)
  dev.off() 
}
remove(var)

# COM FILTRO / ESCALA CARTESIANA
po <- 5     #Ordem do polinômio
no <- 15    #Períodos ponderados
for(var in unique(df_estados$uf))
{
  filteredVector <- signal::filter(filt= sgolay(p = po, n = no), df_estados[df_estados$uf == var,"cases"])
  p3_data <- data.frame(filtered=filteredVector ,uf=rep(var, length(filteredVector)))
  p3_data <- p3_data[(no+1):nrow(p3_data),] # excluindo as primeiras N observações (N = no)
  p3 <- ggplot(data=p3_data) + 
    geom_line(stat= "identity", 
              aes(x=1:nrow(p3_data), y=filtered), size=2, colour="blue")+
    labs(title = paste("Casos totais no estado de",var, "por dia, com filtro" ),
         subtitle = paste("Savitzky-Golay:", "p=",po,"n=",no),
         caption = paste("Origem dos dados:",origem,"\n Atualizado em:", last_update,"   -  Autor: Eduardo Costa - duducosta.github.io/Covid19-Brazil/"))+
    xlab("Days") + ylab("Casos totais") +
    theme_light()+
    theme(axis.title = element_text(face="bold",colour="red",size=20),
          axis.text = element_text(face="bold",size=15),
          plot.title = element_text(lineheight = 0.8,face="bold",size=30),
          plot.caption = element_text(lineheight = 0.8,size=15))
  jpeg(paste(var,"-TC-Filtro.jpeg",sep=""), width= g_width, height= g_height)
  print(p3)
  dev.off()
  remove(filteredVector)
  remove(p3)
}

# SEM FILTRO / ESCALA CARTESIANA / COM ACELERAÇÃO
# Calculada aceleração com base semanal 
# Cores da colunas = aceleração
# Base de cálculo são os dados após filtro, e não dados diretos
for(var in unique(df_estados$uf))
{
  df_temp2 <- signal::filter(filt= sgolay(p = po, n = no), df_estados[df_estados$uf == var,"cases"])
  df_temp <- df_estados[df_estados$uf==var,]
  df_temp$cases <- df_temp2
  df_temp$datetime <-NULL
  df_temp <- df_temp %>% group_by(uf, week) %>% summarise_all(max) %>% ungroup()
  df_temp <- as.data.frame(df_temp)
  df_temp$deltaCases <- rep(NA,nrow(df_temp))
  df_temp$avgNewCasesDay <- rep(NA,nrow(df_temp)) #delta y do gráfico
  df_temp <- df_temp %>% group_by(uf) %>% mutate(deltaCases = cases-lag(cases))
  df_temp <- df_temp %>% mutate(avgNewCasesDay = ((deltaCases/100)/7)) #(delta y(casos)/delta x(dias em uma semana). Divido por 100 para dar mais sensibilidade ao ângulo
  df_temp$TanAngle <- (atan(df_temp$avgNewCasesDay) * (180/pi)) #converter para graus e trazer para 0-360
  df_temp <- as.data.frame(df_temp)
  df_temp$deaths <- NULL
  # imprimir tabela
  # cada linha usa em média 22~23 pixels de altura
  d <- df_temp
  d$cases <- format(round(d$cases), nsmall = 0) #formata para x decimais
  d$deltaCases <- format(round(d$deltaCases), nsmall = 0)
  d$avgNewCasesDay <- format(round(d$avgNewCasesDay), nsmall = 0)
  d$TanAngle <- format(round(d$TanAngle, digits = 2), nsmall = 2)
  tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))
  colnames(d) <- c("Estado", "Semana \nepidem.", "Casos \ntotais", "Aumento \nde casos \nda semana", "Média de \naumento por \ndia (/100)", "Velocidade \ndo aumento")
  jpeg((paste(var,"-Vel_semanal.jpeg",sep="")), width= 450, height= 630)
  grid.newpage()
  grid.table(d)
  dev.off()  
  # fim do imprimir tabela
  df_temp$cases <- NULL
  df_temp$deltaCases <- NULL
  df_temp$avgNewCasesDay <- NULL
  df_estados$TanAngle <-NULL
  df_estados$TanAngle <- left_join(df_estados,df_temp,by=c("uf","week"))[,"TanAngle"] #se a coluna já existir, aconecerá um erro nessa linha
  df_estados[!weeks_complete[df_estados$week,"complete"],"TanAngle"] <-NA  #Desconsidera a semana corrente ainda não fechada
  p1 <- ggplot(data=df_estados[df_estados$uf == var,]) + 
    geom_col(aes(x=datetime, y=cases,fill=TanAngle))+
    geom_line(stat= "identity", 
              aes(x=datetime, y=cases), size=1.5, colour="black")+
    labs(title = paste("Casos totais no estado de",var, "por dia" ),
         subtitle = "",
         caption = paste("Origem dos dados:",origem,"\n Atualizado em:", last_update,"   -  Autor: Eduardo Costa - duducosta.github.io/Covid19-Brazil/"),
         fill="Velocidade de crescimento \n (graus tan)")+
    xlab("Days") + ylab("Casos totais") +
    theme_light()+
    scale_fill_continuous(low="yellow", high="darkred")+
    theme(axis.title = element_text(face="bold",colour="red",size=20),
          axis.text = element_text(face="bold",size=15),
          plot.title = element_text(lineheight = 0.8,face="bold",size=30),
          plot.caption = element_text(lineheight = 0.8,size=15),
          legend.text = element_text(size=15,face="bold"),
          legend.background = element_rect(fill="gray90", size=.5, linetype="dotted"),
          legend.position = "bottom")
  jpeg(paste(var,"-TC-Completo.jpeg",sep=""), width= g_width, height= g_height)
  print(p1)
  dev.off()
  df_estados$TanAngle <-NULL
  remove(df_temp, df_temp2,d,tt)
}


# 2.2 Gráfico dos dados consolidado para o país (y=Casos totais, x=dias)
# SEM FILTRO / ESCALA CARTESIANA
p1_data <-  aggregate(df_estados$cases, by=list(datetime=df_estados$datetime),FUN=sum)
p1 <- ggplot(data=p1_data) + 
  geom_line(stat= "identity", 
            aes(x=datetime, y=x), size=2, colour="blue")+
  labs(title = paste("Casos totais no país por dia" ),
       subtitle = "",
       caption = paste("Origem dos dados:",origem,"\n Atualizado em:", last_update,"   -  Autor: Eduardo Costa - duducosta.github.io/Covid19-Brazil/"))+
  xlab("Days") + ylab("Casos totais") +
  theme_light()+
  theme(axis.title = element_text(face="bold",colour="red",size=20),
        axis.text = element_text(face="bold",size=15),
        plot.title = element_text(lineheight = 0.8,face="bold",size=30),
        plot.caption = element_text(lineheight = 0.8,size=15))
jpeg("0Brasil-TC-Basico.jpeg", width= g_width, height= g_height)
print(p1)
dev.off() 
remove(p1)

# COM FILTRO / ESCALA CARTESIANA 
# OBS: mesmo parâmetros para o filtro
# estas próximas linhas fazem o subset e o filtro
filteredVector <- signal::filter(filt= sgolay(p = po, n = no), p1_data$x)
p3_data <- data.frame(filtered=filteredVector ,uf=rep("Brazil", length(filteredVector)))
p3_data <- p3_data[(no+1):nrow(p3_data),] # excluindo as primeiras N observações (N = no)
p3 <- ggplot(data=p3_data) + 
  geom_line(stat= "identity", 
            aes(x=1:nrow(p3_data), y=filtered), size=2, colour="blue")+
  labs(title = paste("Casos totais no país por dia, com filtro" ),
       subtitle = paste("Savitzky-Golay:", "p=",po,"n=",no),
       caption = paste("Origem dos dados:",origem,"\n Atualizado em:", last_update,"   -  Autor: Eduardo Costa - duducosta.github.io/Covid19-Brazil/"))+
  xlab("Days") + ylab("Casos totais") +
  theme_light()+
  theme(axis.title = element_text(face="bold",colour="red",size=20),
        axis.text = element_text(face="bold",size=15),
        plot.title = element_text(lineheight = 0.8,face="bold",size=30),
        plot.caption = element_text(lineheight = 0.8,size=15))
jpeg("0Brasil-TC-ComFiltro.jpeg", width= g_width, height= g_height)
print(p3)
dev.off() 
remove(p3)

remove(var,po, no, p1_data, filteredVector)


# SEM FILTRO / ESCALA CARTESIANA / COM ACELERAÇÃO
# Calculada aceleração com base semanal 
# Cores da colunas = aceleração
# Base de cálculo são os dados após filtro, e não dados diretos
        #### PRECISA CALCULAR ###


# 2.3 Resumos gerais 
# 2.3.1 Tabelas com casos acumulados por estado, total e percentual
p2_data <- df_estados[df_estados$datetime==max(df_estados$datetime),]
p2_data$percentage <- round(p2_data$cases/sum(p2_data$cases)*100,1)
p2_data$deaths <-NULL
p2_data$datetime <-NULL
p2_data$week <- NULL
p2_data <- p2_data[order(-p2_data$percentage),]
rownames(p2_data) <- 1:nrow(p2_data)
p2_data_temp <- data.frame("Brasil", sum(p2_data$cases), round(sum(p2_data$percentage),0))
names(p2_data_temp) <- colnames(p2_data)
p2_data <- rbind(p2_data,p2_data_temp)
tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))
p2_data$cases <-format(p2_data$cases, decimal.mark = ",", big.mark = ".")
p2_data$percentage <-format(p2_data$percentage, decimal.mark = ",", big.mark = ".")
colnames(p2_data) <- c("Estado", "Casos totais", "Percentual")
jpeg("0Brasil-TC-Tabela.jpeg", width= 250, height= 700)
grid.newpage()
grid.table(p2_data[,])
dev.off() 
remove(p2_data,p3_data,tt,p2_data_temp)

# 2.3.2 Plotagem de mapa com casos por estado
jpeg("0Brasil-TC_mapa.jpeg", width= 500, height= 500)
ggplot(data=shp_data_estados)+
  geom_map(map=shp_dataframe, 
           colour="gray",
           size=0.1, 
           aes(map_id = CD_GEOCUF, fill = casosAcumulado))+
  expand_limits(x=shp_dataframe$long,
                y=shp_dataframe$lat) +
  scale_fill_gradient(low="lightyellow",
                      high="darkred")+
  coord_map()+
  theme_void()+
  theme(legend.position = c(0.2,0.3))
dev.off() 


### FINAL DO ARQUIVO DE TOTAL CASES
setwd("F:\\4 Data Analysis\\Covid19-Brazil")
print("----------------FINAL DO ARQUIVO DE TOTAL CASES------------------")
