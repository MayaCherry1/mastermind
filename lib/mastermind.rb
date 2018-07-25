require_relative './ui_controller'
require_relative './game_loop'

ui = UIController.new
game = GameLoop.new(ui)

game.play