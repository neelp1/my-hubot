# Helper = require 'hubot-test-helper'
sinon = require 'sinon'
chai = require 'chai'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'basic', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      enter: sinon.spy()
      leave: sinon.spy()

    require('../scripts/basic')(@robot)

  it 'registers respond listener', ->
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test /lulz/
    )
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test /(hey|hi|hello)/
    )

  it 'registers hear listener', ->
    expect(@robot.hear).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test /lol/
    )
#
# helper = new Helper('../scripts/basic.coffee')
#
# describe 'basic', ->
#   beforeEach ->
#     @room = helper.createRoom()
#
#   afterEach ->
#     @room.destroy()
#
#   it 'testme', ->
#     @room.user.say('alpha', '@chaty testme').then =>
#       expect(@room.messages).to.eql [
#         ['alpha', '@chaty testme']
#       ]
#
#
#   it 'say lol', ->
#     @room.user.say('alpha', '@chaty lol').then =>
#       expect(@room.messages).to.eql [
#         ['alpha', '@hubot lol']
#         ['hubot', 'lol']
#       ]
