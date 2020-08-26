library(jpeg)
quantile(readJPEG("getdata_jeff.jpg",native=T),probs =0.8)

gdp<-read.csv("getdata_data_GDP.csv",header = T,skip=3)
country<-read.csv("getdata_data_EDSTATS_Country.csv")


test<-merge(gdp,country,by.x = "X",by.y = "CountryCode")
test2<-test[order(test$Ranking,decreasing = T),]
mean(test2$Ranking[test2$Income.Group=="High income: OECD"])
mean(test2$Ranking[test2$Income.Group=="High income: nonOECD"],na.rm = T)

quantile(test2$Ranking,0.20,na.rm = T)
sum(test2$Ranking[test2$Income.Group=="Lower middle income"]<=38.6,na.rm = T)


##Clean4
dt<-read.csv("getdata_data_ss06hid.csv")
gdp<-read.csv("getdata_data_GDP.csv",header = T,skip=3)
gdp$US.dollars.<-gsub(",","",x=gdp$US.dollars.)



sum(weekdays(index(amzn[as.Date(index(amzn))>=as.Date("2012-01-01") & as.Date(index(amzn))<as.Date("2013-01-01")]))==weekdays(as.Date("2020-08-25")))