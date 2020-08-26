myapp=oauth_app("twitter",key="688e07bd7651a7b431b2",secret = "f0176d658bd9f8869963a896acf9523a61e86fa1")
sig<-sign_oauth1.0(myapp,token="",token_secret = "")
homeTL=GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)
#conf<-config(token = "",)





foda<-"https://api.github.com/users/jtleek/repos"

library(httr)
#library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "688e07bd7651a7b431b2",
                   secret = "e1125c16d017cdaf1fa1619480770de3023ae0d4"
)



# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)





sqldf("select pwgtp1 from acs where AGEP < 50")


#sqldf("select * from acs where AGEP < 50 and pwgtp1")


#sqldf("select * from acs")


#sqldf("select pwgtp1 from acs")









sqldf("select unique * from acs")


sqldf("select distinct pwgtp1 from acs")


sqldf("select distinct AGEP from acs")


sqldf("select AGEP where unique from acs")






test<-"http://biostat.jhsph.edu/~jleek/contact.html"
con<-url(test)
htmlCode=readLines(con)



txt<-read.fwf("getdata_wksst8110.for",skip=4,widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4))