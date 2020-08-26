require(httr)
test<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
con<-url(test)
htmlCode=readLines(con)
close(con)
html<-htmlTreeParse(htmlCode,useInternalNodes = T)
xpathApply(html,"//title",xmlValue)
xpathApply(html,"//td@[id='col-citedby']",xmlValue)

html2=GET(test)
content2<-content(html2,as="text")
parsedHtml<-htmlParse(content2,asText=T)
xpathApply(parsedHtml,"//title",xmlValue)


pg2<-GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2

#Use handle to keep cookies
google<-handle("http://google.com")
pg1<-GET(handle=google,path="/")
pg2<-GET(handle=google,path="search")
