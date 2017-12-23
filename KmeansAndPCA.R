## PCA and Kmeans example
# This program was made to a customer in telco industry who need to classify they customers based on "customer lifetime" and "Money Spent in Charges"
# Some parts of this code are useful only in RStudio.
# The final product was setup in TIBCO Spotfire and TERR.
# Mail: rodrigo.eiras@live.com


## PCA & DataPrep

base <- tabela_AmostraM4U
base.numeric <- base[, sapply(base, class) == "numeric"]

ACP <- prcomp(base.numeric, scale = TRUE)
summary(ACP)
ACP$rotation

screeplot(ACP)
biplot(ACP)

## Scores

matriz <- as.matrix(base.numeric)%*%ACP$rotation[,1:2]
t <- data.frame(matriz,base$MSISDN)

## Kmeans

#cluster <- data.frame(as.matrix(base)%*%ACP$rotation[,1],
#                      as.matrix(base)%*%ACP$rotation[,2])

kmeans <- kmeans(t,centers=4)

tabelaClusters <- data.frame(matriz,base$MSISDN,kmeans$cluster)