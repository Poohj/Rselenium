
#############################################################################################################
#############################################################################################################
#############################################################################################################
##                          Selenium 시작                   #################################################
#############################################################################################################
#############################################################################################################
#############################################################################################################
#############################################################################################################


#install.packages("RSelenium")
#install.packages("wdman")
library(RSelenium)
library(wdman)
library(dplyr)
library(magrittr)
library(rvest)




driver<- rsDriver(port=4445L,browser = "chrome",verbose = FALSE, check = FALSE)

remDr <- driver$client


hitter_player_base_record <- list()


data_basic_1_1 = list()
data_basic_1_2 = list()
data_basic_1_3 = list()
data_basic_2_1 = list()
data_basic_2_2 = list()
data_basic_2_3 = list()


for( j in 1:10){

  
  Sys.setlocale("LC_ALL", "English")
  
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  ##                    기본기록 첫번째 crwaling                               ################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  
  
  remDr$navigate("https://www.koreabaseball.com/Record/Player/HitterBasic/Basic1.aspx")
  
  
  ##############################################################################################################
  ############ 팀선택 옵션 클릭 및 선택       ##################################################################
  ##############################################################################################################
  # 2 : 넥센                                  ##################################################################
  # 3 : 두산                                  ##################################################################                                  
  # 4 : 롯데                                  ##################################################################
  # 5 : 삼성                                  ##################################################################
  # 6 : 한화                                  ##################################################################
  # 7 : KIA                                   ##################################################################
  # 8 : KT                                    ##################################################################
  # 9 : LG                                    ##################################################################
  # 10 : NC                                   ##################################################################
  # 11 : SK                                   ##################################################################
  ##############################################################################################################
  ##############################################################################################################
  ##############################################################################################################
  
  
  team_select <- remDr$findElement(using = 'xpath', value = sprintf('//*[@id="cphContents_cphContents_cphContents_ddlTeam_ddlTeam"]/option[%s]',j+1))
  
  team_select$clickElement()
  
  Sys.sleep(2)
  
  ## 기본기록 버튼클릭(1페이지)
  try({
    
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo1")
    
    
    morereviews$clickElement()
    Sys.sleep(4)
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_basic_1_1[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
  },silent=T)
  
  

  ## 기본기록 버튼클릭(2페이지)
  
  try({
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo2")
    
    morereviews$clickElement()
    Sys.sleep(2)
    
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_basic_1_2[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
  },silent=T)
  
  ## 기본기록 버튼클릭(3페이지)
  
  try({
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo3")
    
    morereviews$clickElement()
    
    Sys.sleep(4)
    
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_basic_1_3[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
  },silent=T)
  
  
  
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  ##                    기본기록 두번째 crwaling                               ################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  
  
  remDr$navigate("https://www.koreabaseball.com/Record/Player/HitterBasic/Basic2.aspx")
  
  
  ##############################################################################################################
  ############ 팀선택 옵션 클릭 및 선택       ##################################################################
  ##############################################################################################################
  # 2 : 넥센                                  ##################################################################
  # 3 : 두산                                  ##################################################################                                  
  # 4 : 롯데                                  ##################################################################
  # 5 : 삼성                                  ##################################################################
  # 6 : 한화                                  ##################################################################
  # 7 : KIA                                   ##################################################################
  # 8 : KT                                    ##################################################################
  # 9 : LG                                    ##################################################################
  # 10 : NC                                   ##################################################################
  # 11 : SK                                   ##################################################################
  ##############################################################################################################
  ##############################################################################################################
  ##############################################################################################################
  
  
  team_select <- remDr$findElement(using = 'xpath', value = sprintf('//*[@id="cphContents_cphContents_cphContents_ddlTeam_ddlTeam"]/option[%s]',j+1))
  
  team_select$clickElement()
  
  Sys.sleep(2)
  

  try({
    ## 기본기록_2 버튼클릭(1페이지)
    
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo1")
    
    morereviews$clickElement()
    Sys.sleep(4)
    
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_basic_2_1[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
  },silent=T)
  
  ## 기본기록_2 버튼클릭(2페이지)
  
  try({
      morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo2")
      
      morereviews$clickElement()
      Sys.sleep(4)
      
      webElem <-remDr$findElement(using = "class", value = "record_result")
      results <- webElem$getElementText()
      
      webElem5txt <- webElem$getElementAttribute("outerHTML")
      
      page_source <- remDr$getPageSource()
      
      data_basic_2_2[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
  },silent=T)
  
  
  ## 기본기록_2 버튼클릭(3페이지)
  
  try({
      morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo3")
      
      morereviews$clickElement()
      
      Sys.sleep(4)
      webElem <-remDr$findElement(using = "class", value = "record_result")
      results <- webElem$getElementText()
      
      webElem5txt <- webElem$getElementAttribute("outerHTML")
      
      page_source <- remDr$getPageSource()
      
      data_basic_2_3[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
  },silent=T)

  

  
}


#############################################################################################################
#############################################################################################################
#############################################################################################################
####                      데이터 통합                                       #################################
#############################################################################################################
#############################################################################################################
#############################################################################################################
#############################################################################################################



for(i in 1:10){
  
  if(is.null(data_basic_1_1[[i]])==FALSE) {data_basic_1_1[[i]]$AVG <- as.character(data_basic_1_1[[i]]$AVG)}
  
  if(is.null(data_basic_2_1[[i]])==FALSE) {data_basic_2_1[[i]]$OBP <- as.character(data_basic_2_1[[i]]$OBP)}
  if(is.null(data_basic_2_1[[i]])==FALSE) {data_basic_2_1[[i]]$OPS <- as.character(data_basic_2_1[[i]]$OPS)}
  if(is.null(data_basic_2_1[[i]])==FALSE) {data_basic_2_1[[i]]$AVG <- as.character(data_basic_2_1[[i]]$AVG)}
  if(is.null(data_basic_2_1[[i]])==FALSE) {data_basic_2_1[[i]]$SLG <- as.character(data_basic_2_1[[i]]$SLG)}
  

}

for(i in 1:9){
  
  if(is.null(data_basic_1_2[[i]])==FALSE) {data_basic_1_2[[i]]$AVG <- as.character(data_basic_1_2[[i]]$AVG)}
  
  if(is.null(data_basic_2_2[[i]])==FALSE) {data_basic_2_2[[i]]$OBP <- as.character(data_basic_2_2[[i]]$OBP)}
  if(is.null(data_basic_2_2[[i]])==FALSE) {data_basic_2_2[[i]]$OPS <- as.character(data_basic_2_2[[i]]$OPS)}
  if(is.null(data_basic_2_2[[i]])==FALSE) {data_basic_2_2[[i]]$AVG <- as.character(data_basic_2_2[[i]]$AVG)}
  if(is.null(data_basic_2_2[[i]])==FALSE) {data_basic_2_2[[i]]$SLG <- as.character(data_basic_2_2[[i]]$SLG)}
  
}



base_A = bind_rows(data_basic_1_1,data_basic_1_2,data_basic_1_3)[,-1]

base_B = bind_rows(data_basic_2_1,data_basic_2_2,data_basic_2_3)[,-1]

Sys.setlocale("LC_ALL", "Korean")

hitter_player_base_record = left_join(base_A,base_B,by=c("선수명","팀명","AVG"))



######################################################################
#####       데이터 저장 ##############################################
######################################################################


write.csv(data.frame(season="2018",hitter_player_base_record),"~/hitter_player_base_record.csv",row.names = FALSE)



## 셀레니움 종료

remDr$close()

## 드라이버 사용종료

rm(driver)

## 메모리 삭제

gc()