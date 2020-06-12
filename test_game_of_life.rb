require 'minitest/autorun'
require './game_of_life'

class TestGame < Minitest::Test
  def setup
    @game = GameOfLife.new(10)
  end

  def test_initialize
    matrix = Array.new(10){Array.new(10)}
    assert_equal matrix, @game.world
    assert_equal matrix, @game.neighborhood
  end

  def test_populate
    @game.each { |elem| assert_equal elem, /[1]/ }
  end
end