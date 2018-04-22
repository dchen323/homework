require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @sequence_length = 1
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless game_over
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    p seq.last
    sleep(1)
    system("clear")
  end

  def require_sequence
    sequence_length.times do |idx|
      puts "Guess a color(eg: red, blue, green, yellow)"
      input = gets.chomp
      self.game_over = check_guess?(idx,input) ? false : true
    end
  end

  def check_guess?(idx,input)
    seq[idx] == input
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Congrats adding, a new color"
  end

  def game_over_message
    puts "Game over! You lasted #{sequence_length} rounds!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__== $PROGRAM_NAME
  game = Simon.new
  game.play
end
