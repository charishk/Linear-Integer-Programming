library(readxl)
library(data.table)

df <- read_excel("PATH",sheet = 1)

# Q2a
threshold <- 0
data <- data.frame(stringsAsFactors=FALSE)
for (i in seq(0,1,0.01)){
  threshold=i
  df['predicted_values']=ifelse(df$prob.admit>=threshold,'Above','Below')
  sen <- dim(subset(subset(df,disposition=='Admit'),predicted_values=='Above'))[1]/dim(df[df$disposition=='Admit',])[1]
  spe <- dim(subset(subset(df,disposition=='Discharge'),predicted_values=='Below'))[1]/dim(df[df$disposition=='Discharge',])[1]
  data <- rbind(data,data.frame(threshold,sen,spe))
}
plot(data$threshold, data$sen)
plot(data$threshold, data$spe)

# Q2b
ph <- 0.3
pl <- 0.7 
cl <- 1 
ch <- 10
u <- 10 #uh=ul

for (lambda in c(2,4,6,8)){
  dt <- data
  dt$lambda <- lambda
  dt$sys_congestion <- NA
  dt$waiting_cost <- NA
  for (i in 0:dim(data)[1]){
    sens <- data$sen[i]
    spec <- data$spe[i]
    rho <- lambda*(ph/u+pl/u) 
    x <- (2)/(u**2) 
    y <- (rho**2/(1-rho))*((ph*x+pl*x)/((2)*(ph/u+pl/u)))*((ph*ch*(1-(rho*sens))+pl*cl*(1-rho*(1-spec)))/
         ((ph/u)*(1-(rho*sens))+(pl/u)*(1-rho*(1-spec))))
    dt$sys_congestion[i] <- rho
    dt$waiting_cost[i]<-y
  }
  print(dt[dt$waiting_cost==min(dt$waiting_cost),])
}

# Q2c
cl <-1 
ch <- 10
ph <- 0.3
pl <- 0.7
uh <- 10 
ul <- 50

for (lambda in c(2,4,6,8)){
  dt <- data
  dt$lambda <- lambda
  dt$sys_congestion=NA
  dt$waiting_cost=NA
  for (i in 0:dim(data)[1]){
    sens=data$sen[i]
    spec=data$spe[i]
    rho <- lambda*(ph/uh+pl/ul) 
    sh <- (2)/(uh**2)
    sl <- (2)/(ul**2)
    w <- (rho**2/(1-rho))*((ph*sh+pl*sl)/((2)*(ph/uh+pl/ul)))*((ph*ch*(1-(rho*sens))+pl*cl*(1-rho*(1-spec)))/
         ((ph/uh)*(1-(rho*sens))+(pl/ul)*(1-rho*(1-spec))))
    dt$sys_congestion[i] <- rho
    dt$waiting_cost[i] <- w
  }
  print(dt[dt$waiting_cost==min(dt$waiting_cost),])
}

##d
cl <- 1 
ch <- 10
ph <- 0.3
pl <- 0.7
uh <- 10 
ul <- 120

for (lambda in c(2,4,6,8)){
  dt <- data
  dt$lambda <- lambda
  dt$sys_congestion <- NA
  dt$waiting_cost <- NA
  for (i in 0:dim(data)[1]){
    sens=data$sen[i]
    spec=data$spe[i]
    rho <- lambda*(ph/uh+pl/ul) 
    sh <- (2)/(uh**2)
    sl <- (2)/(ul**2)
    w <- (rho**2/(1-rho))*((ph*sh+pl*sl)/((2)*(ph/uh+pl/ul)))*((ph*ch*(1-(rho*sens))+pl*cl*(1-rho*(1-spec)))/
         ((ph/uh)*(1-(rho*sens))+(pl/ul)*(1-rho*(1-spec))))
    dt$sys_congestion[i] <- rho
    dt$waiting_cost[i] <- w
  }
  print(dt[dt$waiting_cost==min(dt$waiting_cost),])
}
