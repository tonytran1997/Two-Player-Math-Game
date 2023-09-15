require './01_player_class.rb'
require './02_game_class.rb'
require './03_math_question_class.rb'

player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

game = Game.new(player1, player2)
game.game_loop 