setwd("E:\\Kent\\Fundamentals of Machine Learning - Prof Murali Shanker\\Assignment_3")
cust_data <- read.csv("UniversalBank.csv")
head(cust_data)
str(cust_data)

cust_data$CreditCard <- as.factor(cust_data$CreditCard)
cust_data$Online <- as.factor(cust_data$Online)
cust_data$Personal.Loan <- as.factor(cust_data$Personal.Loan)
str(cust_data)

library(caret)
set.seed(1000)
Train_Index <- createDataPartition(cust_data$ID, p = 0.6, list = FALSE)
Train_df <- cust_data[Train_Index,]
nrow(Train_df)
Valid_df <- cust_data[-Train_Index,]
nrow(Valid_df)

#Pivot <- table(Train_df$Online,Train_df$Personal.Loan,Train_df$CreditCard)
#Pivot
#pivot_df <- as.data.frame(Pivot)
#colnames(pivot_df) <- c("PersonalLoan", "Online", "CreditCard","Sum")
#pivot_df

Pivot <- table(Train_df$Personal.Loan,Train_df$CreditCard, )
Pivot
pivot_df <- as.data.frame(Pivot)
colnames(pivot_df) <- c("PersonalLoan", "CreditCard","age")
pivot_df

Prob_POCC <- 48/3000#From the table the probability for a person accepting a loan and having a credit card issued and taken online services
Prob_POCC

Pivot_PO <- table(Train_df$Personal.Loan, Train_df$Online)
colnames(Pivot_PO) <- c("Online0", "Online1")
Pivot_PO
Pivot_PCC <- table(Train_df$Personal.Loan, Train_df$CreditCard)
Pivot_PCC
Pivot_PL <- table(Train_df$Personal.Loan)
Pivot_PL

#Probabilities
A <- 83/(83+790) #P(CreditCard = 1| Loan = 1)
A

B <- 165/(165+1644) #P(Online = 1| Loan = 1)
B

C <- (279)/3000 #P(Loan = 1) 
C

D <- 790/(1931+790)#P(CC = 1 | Loan = 0) 
D

E <- 1644/(1644+1077) #P(Online = 1 | Loan = 0)
E

F <- 2721/3000 #P(Loan = 0) 
F

CalNaiBay <- 0.093*(0.0950*0.0912)/ 0.093*(0.0950*0.0912)+(0.907*(0.290*0.604))
CalNaiBay


