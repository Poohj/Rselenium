
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


pitcher_player_detail_record <- list()


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
  
  
  remDr$navigate("https://www.koreabaseball.com/Record/Player/PitcherBasic/Detail1.aspx")
  
  
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
  
  data_detail_1_1 = list()
  data_detail_1_2 = list()
  data_detail_1_3 = list()
  
  ## 기본기록 버튼클릭(1페이지)
  try({
    
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo1")
    
    
    morereviews$clickElement()
    Sys.sleep(4)
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_detail_1_1[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
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
    
    data_detail_1_2[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
  },silent=T)
  
  ## 기본기록 버튼클릭(3페이지)
  
  try({
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo3")
    
    morereviews$clickElement()
    Sys.sleep(2)
    
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_detail_1_3[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
  },silent=T)
  
  
  
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  ##                    기본기록 두번째 crwaling                               ################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  
  
  remDr$navigate("https://www.koreabaseball.com/Record/Player/PitcherBasic/Detail2.aspx")
  
  
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
  
  data_detail_2_1 = list()
  data_detail_2_2 = list()
  data_detail_2_3 = list()
  
  
  ## 기본기록_2 버튼클릭(1페이지)
  
  morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo1")
  
  morereviews$clickElement()
  Sys.sleep(4)
  webElem <-remDr$findElement(using = "class", value = "record_result")
  results <- webElem$getElementText()
  
  webElem5txt <- webElem$getElementAttribute("outerHTML")
  
  page_source <- remDr$getPageSource()
  
  data_detail_2_1[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
  
  
  ## 기본기록_2 버튼클릭(2페이지)
  
  try({
    morereviews <- remDr$findElement(using = 'id', value = "cphContents_cphContents_cphContents_ucPager_btnNo2")
    
    morereviews$clickElement()
    Sys.sleep(4)
    
    webElem <-remDr$findElement(using = "class", value = "record_result")
    results <- webElem$getElementText()
    
    webElem5txt <- webElem$getElementAttribute("outerHTML")
    
    page_source <- remDr$getPageSource()
    
    data_detail_2_2[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
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
    
    data_detail_2_3[[j]] = read_html(page_source[[1]]) %>% html_nodes("table") %>% html_table() %>% extract2(1)
    
  },silent=T)
  
  
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  ####                      데이터 통합                                       #################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  #############################################################################################################
  
  
  
  
  
  
  detail_A = bind_rows(data_detail_1_1,data_detail_1_2,data_detail_1_3)[,-1]
  
  detail_B = bind_rows(data_detail_2_1,data_detail_2_2,data_detail_2_3)[,-1]
  
  Sys.setlocale("LC_ALL", "Korean")
  
  pitcher_player_detail_record[[j]] = left_join(detail_A,detail_B,by=c("선수명","팀명","ERA"))
  
  
}


######################################################################
#####       데이터 저장 ##############################################
######################################################################



for (i in 1:length(pitcher_player_detail_record)){
  
  pitcher_player_detail_record[[i]]$`GO/AO` <- as.character(pitcher_player_detail_record[[i]]$`GO/AO`)
  pitcher_player_detail_record[[i]]$`K/BB` <- as.character(pitcher_player_detail_record[[i]]$`K/BB`)
  pitcher_player_detail_record[[i]]$`BB/9` <- as.character(pitcher_player_detail_record[[i]]$`BB/9`)
  pitcher_player_detail_record[[i]]$`K/9` <- as.character(pitcher_player_detail_record[[i]]$`K/9`)
  pitcher_player_detail_record[[i]]$`P/IP` <- as.character(pitcher_player_detail_record[[i]]$`P/IP`)
  pitcher_player_detail_record[[i]]$`ERA` <- as.character(pitcher_player_detail_record[[i]]$`ERA`)
  
}

write.csv(data.frame(season="2018",bind_rows(pitcher_player_detail_record)),"~/pitcher_player_detail_record.csv",row.names = FALSE)


## 셀레니움 종료

remDr$close()

## 드라이버 사용종료

rm(driver)

## 메모리 삭제

gc()