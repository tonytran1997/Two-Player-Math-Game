require "./01_player_class"

class Game

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
  end

  def game_loop
    loop do
      active_player = @players[@current_player_index]
      other_player = @players[1 - @current_player_index]

      puts "---- NEW TURN -----"

      question = MathQuestion.new

      puts "#{active_player.name}: #{question.question}"

      player_answer = gets.chomp

      if question.check_answer(player_answer)
        puts "Nice Job!"
        active_player.answer_question(true)
      else
        puts "Incorrect! The correct answer is #{question.answer}."
        active_player.answer_question(false)
      end

      puts "#{active_player.display_score} | #{other_player.display_score}"

      if active_player.lives == 0
        puts "#{other_player.name} wins with a score of #{other_player.score}"
        break
      end
      @current_player_index = 1 - @current_player_index
    end
    puts "Game Over!"
  end 
end