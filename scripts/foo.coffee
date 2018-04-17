module.exports = (robot) ->
  robot.respond /testme/i, (res) ->
    res.send "test"

  robot.hear /(foo|bar)/i, (res) ->
    res.send "42"
