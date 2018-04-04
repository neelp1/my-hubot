module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao']

  # responds if chaty is asked directly ie "chaty lulz"
  robot.respond /lulz/i, (res) ->
    res.send res.random lulz

  # hears in a chatroom ie "I can't believe it lulz"
  robot.hear /lol/i, (res) ->
    res.send res.random lulz
