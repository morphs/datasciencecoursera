
require(gdata)
require(XML)
require(openxlsx)
dt<-read.csv("getdata_data_ss06hid.csv")

sum(dt$VAL==24,na.rm = TRUE)

dat<-read.xlsx("getdata_data_DATA.gov_NGAP.xlsx",rows = 18:23,cols = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)


doc<-xmlTreeParse("getdata_data_restaurants.xml",useInternal=T)
rootNode<-xmlRoot(doc)
sum(xpathApply(rootNode,"//zipcode",xmlValue) ==21231)


system.time(replicate(100,{mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))


system.time(replicate(100,{mean(DT$pwgtp15,by=DT$SEX)}))


system.time(replicate(100,{tapply(DT$pwgtp15,DT$SEX,mean)}))


system.time(replicate(100,{DT[,mean(pwgtp15),by=SEX]}))##################


system.time(replicate(100,{sapply(split(DT$pwgtp15,DT$SEX),mean)}))


system.time(replicate(100,{rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))
