Feature: Api Testing

  Background:
  *  url 'https://open.spotify.com/'
  * def userid = 'mksblas79kcjizgg13o0oeir5'


  * def Token = 'BQB_qJkPsJxkM9nywfkaLpQ-nWrcr9ja1BUp1Pi45PxXEozCplzaF9c0JaTPCPuTwokqn00Qgh9FBikbksk1OIbAXqqs2AUUXZF5Q7CI6juSC0a11lRWppG-nAJ8ccGiFKSDTXb2OLJNkLVMGHN54SbIKyJEu3-QQhaA-UoOVG2rm8o3R7fOwWBaI9rH7aWN4XIcN9woffcCCrph6g9Ib0CWUI_EiWl5PLVaeCrNCeRPC7OdX5Fr-peijehhScZHU9yxi5KEIsId0gJJV5TKpD5uHA'

  * def requestbody =
  """
  {
  "name": "MentorLabs",
  "description": "Test başarılı",
  "public": false
  }
    """

    * def requestAdd =
    """
 {
  "uris": [
    "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ],
  "position": 0
}
    """
  Scenario: Main Testing
    #user_id'yi bu kısımdan alıyoruz.
      Given url 'https://api.spotify.com/v1'
      And path '/me'
      And header Authorization = 'Bearer ' +Token
      When method get

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
          And param q = 'Bohemian Rhapsody'
          And  param type = 'track'
          And header Content-Type = 'application/json'
          When method get

          * def playlistUri = response.tracks.items[5].uri
            And def requestAdd = {uris:[#(playlistUri)]}
            And url 'https://api.spotify.com/v1'
            And path '/playlists/'+playlist_id+'/tracks'
            And header Authorization = 'Bearer ' +Token
            And header Content-Type = 'application/json'
            And request requestAdd
            When method post




