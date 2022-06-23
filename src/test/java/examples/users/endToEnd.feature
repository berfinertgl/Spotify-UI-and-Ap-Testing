Feature: EndToEnd
  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }
    *  url 'https://open.spotify.com/'
    * def userid = 'mksblas79kcjizgg13o0oeir5'

    * def Token = 'BQAbDmG7xuyfNuQt0kCcPF1XHar8sqbLtF1bkWwym5fiqMgx-a91vW27CGrZW6n1WkX6zETrViODak0Z784wdznkBfCwqV9zRf9k_oOCDyEwBs_57JbKqDmTyPQy7e2MJkW9rg-f9VUra5q6xvqk4B-n8EW7ePJ4c1avor7VZttS4sOoBfIYUSrpXvIpgr4Zem0xvmNLHn4gXKOxtLlSIRQTlR3F4_5mWR6uks13aFPpm0JF_MpAjbQ4VGo0RlMv8RxssF-bkXtnqZrdk4ndA7EAcEA'


    Scenario: My Scenario
      Given driver 'https://open.spotify.com/'
      * maximize()
      When click("//button[@data-testid='login-button']")
      And input('#login-username', 'berfinertogluu@gmail.com')
      And input('#login-password','berfin161096')
      When delay(2000)
      And waitFor('#login-button').click()
      And waitFor("//div[@class='AINMAUImkAYJd4ertQxy'][1]").click()
      And click('.T0anrkk_QA4IAQL29get.mYN_ST1TsDdC6q1k1_xs')
      * delay(5000)
      And waitFor("//span[contains (text(), 'Bu çalma listesinden kaldır')]").click()
      And waitForEnabled('.ButtonInner-sc-14ud5tc-0.gHYQaG.encore-bright-accent-set')
      * print 'Liste boştur.'
      * delay(2000)
      And waitFor("//a[@href='/search']").click()
      And click('.ButtonInner-sc-14ud5tc-0.ghyeqb.encore-inverted-light-set.un9ka9FQajcXmx1ncJIo')
      * scroll("//a[@href='/genre/mood-page']").click()
      And waitFor("//h1[contains (text(), 'Ruh Hali')]")
      * print 'Ruh hali kategorisine gidildi.'
      And mouse().move("//div[@class='iKwGKEfAfW7Rkx2_Ba4E Z4InHgCs2uhk0MU93y_a']/div[2]").click()
      And waitFor('.Fm7C3gdh5Lsc9qSXrQwO.tGKwoPuvNBNK3TzCS5OH').click()
      * delay(3000)

      And waitFor("//a[@class='r9YzlaAPnM2LGK97GSfa']/span[contains(text(),'Beğenilen Şarkılar')]").click()
      * delay(3000)

      Then match text("//div[text()='Bilmem Mi?']") == 'Bilmem Mi?'

      When click('.T0anrkk_QA4IAQL29get.mYN_ST1TsDdC6q1k1_xs')
      And  mouse().move("//span[contains(text(),'Çalma listesine ekle')]").click()
      * delay(1000)
      And waitFor("//button[@class='wC9sIed7pfp47wZbmU6m']/span[contains(text(),'MentorLabs Faz-2')]").click()
      * delay(3000)
      And click("//a[@class='standalone-ellipsis-one-line utSR0FVkHnII_aL8TOcu']/span[contains(text(),'MentorLabs Faz-2')]")
      And waitFor('.Type__TypeElement-goli3j-0.hVBZRJ').click()
      And click("//input[@data-testid='playlist-edit-details-name-input']")
      * delay(2000)

      * script('.f0GjZQZc4c_bKpqdyKbq.JaGLdeBa2UaUMBT44vqI', "_.value = ''")
      And input('.f0GjZQZc4c_bKpqdyKbq.JaGLdeBa2UaUMBT44vqI','Mood')
      * delay(2000)

      And waitFor('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set').click()
      * delay(2000)

      And click('.Button-qlcn5g-0.iaAUvZ')
      * delay(15000)






