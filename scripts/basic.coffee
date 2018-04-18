# Description
#   General basic chat conversation capabilities
#
# Commands:
#   hubot encode <text> - encodes the given text to morse code
#   hubot decode <text> - decodes the given text from morse code
#
# Configuration:
#   PORT - may need to change port from default to avoid EADDRINUSE
#
# Notes:
#   Hubot can lol along with you, remember your name,
#   comment on people leaving and entering room etc.
#
# Author:
#   Neel
module.exports = (robot) ->
  lulz = ['lol', 'rofl', 'lmao']

  robot.respond /lulz/i, (res) ->
    res.send res.random lulz

  robot.hear /lol/i, (res) ->
    res.send res.random lulz

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
    res.reply numOfApples

  robot.respond /My name is (.*)/i, (res) ->
    robot.brain.set 'yourName', res.match[1]

  robot.respond /what is my name/i, (res) ->
    yourName = robot.brain.get('yourName')
    res.send yourName
