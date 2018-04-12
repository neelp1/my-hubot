module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao']

  # responds if chaty is asked directly ie "chaty lulz"
  robot.respond /lulz/i, (res) ->
    res.send res.random lulz

  # hears in a chatroom ie "I can't believe it lulz"
  robot.hear /lol/i, (res) ->
    res.send res.random lulz

  # Reply to Hi Chaty
  greet = ['hey', 'hi', 'hello']
  robot.respond /(hey|hi|hello)/i, (res) ->
    res.reply res.random greet

  enterReplies = ['Target Acquired', 'Look who it is..', 'I see you']
  leaveReplies = ['Thank god, I thought they would never leave', 'Target lost', 'loooosserrr']

  robot.enter (res) ->
    res.send res.random enterReplies
  robot.leave (res) ->
    res.send res.random leaveReplies

  robot.respond /have an apple/i, (res) ->
    robot.brain.set 'totalApples', 1

  robot.respond /how many apples\?/i, (res) ->
    numOfApples = robot.brain.get('totalApples')
    res.send numOfApples
