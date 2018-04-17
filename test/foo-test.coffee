sinon = require 'sinon'
chai = require 'chai'

expect = chai.expect

describe 'foo', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../scripts/foo')(@robot)

  it 'registers respond listener', ->
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test /testme/
    )

  it 'registers hear listener', ->
    expect(@robot.hear).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test /(foo|bar)/
    )

  it 'respond listerner called with testme', ->
    sinon.assert.calledWith(@robot.respond, /testme/i)

  it 'respond listener should be ok with testme', ->
    expect(@robot.respond).to.have.been.calledWith(/testme/i)

  # it 'respond listener should be ok with testme', ->
