Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }

  Scenario: Spotify Login
    Given driver 'https://open.spotify.com/'
    * maximize()
    When delay(2000)
    And click("//button[@data-testid='login-button']")
    When delay(1000)
    And input('#login-username', 'berfinertogluu@gmail.com')
    And input('#login-password','berfin161096')
    When delay(2000)
    And waitFor('#login-button').click()
    And waitFor("//button[@data-testid='create-playlist-button']").click()
    And waitFor('.Type__TypeElement-goli3j-0.hVBZRJ').click()
    And input("//input[@data-testid='playlist-edit-details-name-input']",'MentorLabs Challenge')
    When delay(1000)
    And click('.Button-qlcn5g-0.jvEinx')
    And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc','Daft Punk')
    And waitFor("//button[@data-testid='add-to-playlist-button']").click()
    And waitFor("//div[contains(text(),'Çalma Listesine eklendi')]")

