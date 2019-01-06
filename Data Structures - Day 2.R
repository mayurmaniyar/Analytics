#Title : Data structures in R


#Vector----

cv = c("Mayur","Suraj","Rohan")
class(cv)
nv = c(12,435,54)
lv = c(TRUE,FALSE,T)

cv
nv
lv

(x = 1:100000)

set.seed(100)
x = trunc(rnorm(100000,mean = 60,sd = 10))
x
sort(x)
x
x1 = sort(x)
x1
#how many vales between 60 and 70
x[x >= 60 & x <= 70]
length(x)
length(x[x >= 60 & x <= 70])


# standard normal
x2 = rnorm(1000,mean = 10, sd = 2)
plot(density(x2))

abline(v=10,h=0.1)

#sequence of number
x3=seq(1,100,by=2)
mean(x3)
x

mean(x)
median(x)
mode(x) # this is not actual mode



xt = table(x)
xt
sort(xt, decreasing = T)[1:2]
summary(x)
quantile(x)
quantile(x,c(0.1,0.5,0.9))
quantile(x, seq(0,1,.1))
seq(0,1,.1)

text(1,30,labels = "mayur")

# boxplot is - 5 number summary
boxplot(x)
stem(x)

x3 = rnorm(50,mean=20,sd = 3)
stem(x3)
hist(x3,breaks = 20,col=1:5)
hist(x3,freq = F)

lines(density(x3))






#matrix----


m1 = matrix(c(1:24), nrow = 6)
m1
m1[10:14]
x = 1:24
m2 = matrix(x, nrow = 6,byrow = T)

cbind(m1,m2) #no of 
rbind(m1,m2) #no of column should be same
m1
colSums(m1);rowSums(m1)

colMeans(m1);rowMeans(m1)
m3 = cbind(m1,m2) 
m3

#subset col/row,combination of R & C
m1
m1[1,];m[,1]
m1[1:2,3]
m1[1:2,3:4]
m1[1,2]
m1[c(1,4),c(2,3)]
m1 > 10
m1[m1>10]
m1 > 10 & m1 < 15
m1[m1 > 10 & m1 < 15]
m1
m2
m1-m2
m1+m2

m1*m2

sweep(m1,MARGIN = 1,STATS = c(1,2,3,4,5,6),FUN = "+")#rowwise



#Data frames----
#like excel ,evry column  can be of differnt data types
n = 30
rollno = paste('A',1:n,sep = '')
name = paste('Student',1:n,sep = '@')
name
set.seed(101)
gender = sample(c('M','F'),size = n,replace = T,prob = c(.7,.3))
gender
table(gender)

set.seed(101)
(marks1 = round(rnorm(n=n,mean = 70,sd = 7),2))

(marks2 = round(rnorm(n=n,mean = 50,sd = 10),2))


marks3 = sample(c('A','B','C','D'), size = n,replace = T, prob = c(0.3,0.2,0.3,0.2))
marks3
table(marks3)

df = data.frame(rollno,name,gender,marks1,marks2,marks3,stringsAsFactors = F)
df
summary(df)
str(df)
df$gender = factor(df$gender)
df$gender

summary(df)
df$marks3 = factor(df$marks3)
df$marks3
summary(df)


df
df[1:5,1:2]
df[1:5,c('rollno','name','marks1')]
df[df$marks1 > 70 & gender == 'M',c('rollno','name','marks1','gender')]




df[1:5, c('rollno','name','marks1')]
df[df$marks1 > 70 & gender=='M', c('rollno','name', 'gender', 'marks1')]
df$course = sample(c('MBA','BBA'),size=n, replace=T, prob=c(.6,.4))
head(df)
tail(df)
str(df)
df$marks3 = factor(df$marks3,ordered=T, levels=c('B','D','C','A'))
df$course = factor(df$course)
str(df)

boxplot(marks2 ~ marks3,data = df)
boxplot(marks2 ~ (marks3+gender),data = df)
boxplot(marks2 ~ (course+gender),data = df)


aggregate(marks ~ course,data = df,FUN = mean)
aggregate(marks ~ course + gender,data = df,FUN = mean)


install.packages('dplyr')
library('dplyr')

# group by course , mean of marks 2 # refer cheatsheet
aggregate(marks2 ~ course, data=df, FUN=mean)
df %>% group_by(course) %>% summarise(mean(marks2))
df %>% group_by(course, gender) %>% summarise(mean(marks2), mean(marks1))


df %>% group_by(course) %>% select(marks1) %>% top_n(2)
df %>% filter(gender=='F' & marks3=='A') %>% tally()
df %>% filter(gender=='F' & marks3=='A') %>% summarise(n())
df %>% sample_frac(.2)
df %>% sample_n(3)


install.packages('wordcloud2')
library(wordcloud2)

rollno
name
gender
marks1
marks2
grade





#Factors----