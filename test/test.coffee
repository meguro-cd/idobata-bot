# test
should = (require 'chai').should()

describe 'String', ->
  describe '#concat()', ->
    it 'should return "John Doe"', ->
      # assert values
      'foo'.concat('bar').should.equal 'foobar'