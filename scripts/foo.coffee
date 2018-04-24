module.exports = (robot) ->
  robot.respond /testme/i, (res) ->
    res.send "test"

  robot.hear /(foo|bar)/i, (res) ->
    res.send "42"

  # robot.hear /be annoying/i, (res) ->
  #   setInterval () ->
  #     res.send res.random ['something something','laammee', 'eyyyy']
  #     , 1000
