require_relative 'question'
require_relative 'player'

class Main 
  attr_accessor :player_one, :player_two, :current_player

  def initialize() 
    @player_one = Player.new(1)
    @player_two = Player.new(2)
    @current_player = self.player_one # player one will start first 
  end

  def start 
    while self.current_player.lives > 0 do
      question = Question.new
      puts "Player #{self.current_player.id}: What does #{question.first_number} plus #{question.second_number} equal?"
      answer = gets.chomp.to_i # gets.chomp returns a string, so convert into integer

      if question.is_correct(answer)
        puts "Player #{self.current_player.id}: YES! You are correct."
      else 
        puts "Player #{self.current_player.id}: Seriously? No!"

        self.current_player.lives -= 1
      end

      # switch player after every turn if there are lives still
      if self.current_player.lives == 0
        self.switch_player
        break
      else 
        self.switch_player
        puts "P1: #{self.player_one.lives}/3 vs P2: #{self.player_two.lives}/3"
      end
    end

    puts "Player #{self.current_player.id} wins with a score of #{self.current_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def switch_player
    self.current_player = (self.current_player == self.player_one) ? self.player_two : self.player_one
  end
end

game = Main.new
game.start