Feature: Faz-2
  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }
    *  url 'https://open.spotify.com/'
    * def userid = 'mksblas79kcjizgg13o0oeir5'


    * def Token = 'BQCiQcFaOoI85R_ZGT6QdQ5w8hdMKciD0RMrGHdBCihL0itR496UxqwGnbKEXUh7t_h3eV2EoWE47-9RqQ9ZQWha3BC8VgK94v3jAtxso322eIojhwjAYgsps1lNje_r6OT3rO0CgslXim_infe7LFeb-mzO7n1swibm4GcLZJ6gXKWVsYTJJ6e7YiyZ-UyBvXqSpQhQ_1-YO1DPCJhmdoDZh0LpNE5DloxfGpHKaMjFItPzZuOW9TB7ZYrmRh-XZBG1NO4_YzFCSIVhcWvpe81OSXAx'

    * def requestbody =
  """
  {
  "name": "MentorLabs Faz-2",
  "description": "Test başarılı",
  "public": false
  }
    """
  Scenario: Faz-2 create playlist and add music
    Given driver 'https://open.spotify.com/'
    * maximize()
    When delay(2000)
    And click("//button[@data-testid='login-button']")
    When delay(1000)
    And input('#login-username', 'berfinertogluu@gmail.com')
    And input('#login-password','berfin161096')
    When delay(2000)
    And waitFor('#login-button').click()

    And url 'https://api.spotify.com/v1'
    And path '/users/'+userid+'/playlists'
    And header Authorization = 'Bearer ' +Token
    And request requestbody
    When method post

    * def playlist_id = response.id
    * print response
    And url 'https://api.spotify.com/v1'
    And path 'search'
    And header Authorization = 'Bearer ' +Token
    And param q = 'The Final Countdown'
    And  param type = 'track'
    And header Content-Type = 'application/json'
    When method get

    * def playlistUri = response.tracks.items[0].uri
    And def requestAdd = {uris:[#(playlistUri)]}
    And url 'https://api.spotify.com/v1'
    And path '/playlists/'+playlist_id+'/tracks'
    And header Authorization = 'Bearer ' +Token
    And header Content-Type = 'application/json'
    And request requestAdd
    When method post
    And waitFor("//div[@class='AINMAUImkAYJd4ertQxy'][1]").click()
    And waitFor('.Button-qlcn5g-0.iaAUvZ').click()
    * delay(30000)

    And url 'https://api.spotify.com/v1'
    And path '/me/player/currently-playing'
    And header Authorization = 'Bearer ' +Token
    When method get
    * def verifySong = karate.jsonPath(response,"$.['item']['name']")
    Then match verifySong == 'The Final Countdown'
    * print verifySong


