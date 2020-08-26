outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

#Heart attack rates
outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
 hist(outcome[, 11])
 
best <- function(state, outcome) {
   ## Read outcome data
  dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!any(dt$State==state)) {
    stop("invalid state")
  }
  if((outcome!= "heart attack") && (outcome!= "pneumonia") && (outcome!= "heart failure")){
    stop("invalid outcome")
  } 
  temp<-which(dt$State==state)
  if(outcome=='heart attack'){
    dt[, 11] <- as.numeric(dt[, 11])
    dt$Hospital.Name[temp[which.min(dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[temp])]]  
  }else if(outcome =='heart failure'){
    dt[, 17] <- as.numeric(dt[, 17])
    dt$Hospital.Name[temp[which.min(dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[temp])]]
  }else{
    dt[, 23] <- as.numeric(dt[, 23])
    dt$Hospital.Name[temp[which.min(dt$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[temp])]]
  }
  
   ## Return hospital name in that state with lowest 30-day death
   ## rate
 }
 
rankhospital<-function(state,outcome,rank,seq="best"){
  ## Read outcome data
  dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!any(dt$State==state)) {
    stop("invalid state")
  }
  if((outcome!= "heart attack") && (outcome!= "pneumonia") && (outcome!= "heart failure")){
    stop("invalid outcome")
  }
  temp<-dt[which(dt$State==state),]
  if (seq=="best"){
    if(outcome=='heart attack'){
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,temp$Hospital.Name)[1:rank],c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
      
    }else if(outcome =='heart failure'){
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,temp$Hospital.Name)[1:rank],c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    }else{
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,temp$Hospital.Name)[1:rank],c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    }
  }else{
    if(outcome=='heart attack'){
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,decreasing = TRUE),]
      temp<-temp[temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack !="Not Available",]
      temp<-temp[1:rank,c(2,11)]
    }else if(outcome =='heart failure'){
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,decreasing = TRUE)[1:rank],c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
      temp<-temp[temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure !="Not Available",]
      temp<-temp[1:rank,c(2,17)]
    }else{
      temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia<-as.numeric(as.character(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
      temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,decreasing = TRUE)[1:rank],c("Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
      temp<-temp[temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia !="Not Available",]
      temp<-temp[1:rank,c(2,23)]
    }
  }
  
  
  temp$rank = c(1:rank)
  temp
}

rankall <- function(outcome, rank = 1,seq="best") {
  ## Read outcome data
  dt <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if((outcome!= "heart attack") && (outcome!= "pneumonia") && (outcome!= "heart failure")){
    stop("invalid outcome")
  }
  if(outcome=='heart attack'){
    res<-data.frame(Hospital.Name=character(),
                    Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack=numeric(), 
                    State=character(),
                    rank=integer(), 
                    stringsAsFactors=FALSE)
  }else if (outcome=="heart failure"){
    res<-data.frame(Hospital.Name=character(),
                     Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure=numeric(),
                     State=character(),
                     rank=integer(), 
                     stringsAsFactors=FALSE)
  }else{
    res<-data.frame(Hospital.Name=character(),
                     Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia=numeric(),
                     State=character(),
                     rank=integer(), 
                     stringsAsFactors=FALSE)
    
  }
  ## For each state, find the hospital of the given rank
  it<-unique(dt$State)
  if(seq=="best"){
    for(i in it){
      temp<-dt[which(dt$State==i),]
      if(outcome=='heart attack'){
        temp[, 11] <- as.numeric(temp[, 11])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)[1:rank],c(2,7,11)]
      }else if(outcome =='heart failure'){
        temp[, 17] <- as.numeric(temp[, 17])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)[1:rank],c("Hospital.Name","State","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
      }else{
        temp[, 23] <- as.numeric(temp[, 23])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)[1:rank],c("Hospital.Name","State","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
      }
      temp$rank <- c(1:rank)
      res<-rbind(res,temp)  
    }  
  }else{
    for(i in it){
      temp<-dt[which(dt$State==i),]
      if(outcome=='heart attack'){
        temp[, 11] <- as.numeric(temp[, 11])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,decreasing = TRUE)[1:rank],c(2,7,11)]
      }else if(outcome =='heart failure'){
        temp[, 17] <- as.numeric(temp[, 17])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,decreasing = TRUE)[1:rank],c(2,7,17)]
      }else{
        temp[, 23] <- as.numeric(temp[, 23])
        temp<-temp[order(temp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,decreasing = TRUE)[1:rank],c(2,7,23)]
      }
      temp$rank <- c(1:rank)
      res<-rbind(res,temp)  
    }
    
  }
  
  res
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}