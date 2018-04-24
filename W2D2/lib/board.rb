require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    @current_player = name1
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup,idx|
      next if idx == 6 || idx == 13
      4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1,13)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    max_range = (start_pos + find_stones(start_pos) + 13) % 13
    add_stones(start_pos,max_range,current_player_name)
    cups[start_pos] = []
    render
    next_turn(max_range)
    puts "------"+max_range.to_s+"------"

    return :prompt if score?(max_range, current_player_name)
    return :switch if cups[max_range].empty?
    return max_range unless cups[max_range].empty?
  end

  def score?(max_range, current_player_name)
    return true if max_range == 13 && current_player_name == name2
    return true if max_range == 6 && current_player_name == name1
    return false
  end

  def switch

  end

  def find_stones(start_pos)
    cups[start_pos].length
  end

  def add_stones(start_pos,max_range,current_player_name)
    stones = find_stones(start_pos)

    cups.each_with_index do |cup,idx|
      next if idx == 6 && current_player_name == name2
      next if idx == 13 && current_player_name == name1
      max_range += 1 if add_max_range?(start_pos)
      next if !idx.between?(((start_pos+1) % 13), max_range)
      cup << :stone
    end
  end

  def add_max_range?(start_pos)
    stones = find_stones(start_pos)
    start_pos + stones == 13 || start_pos + stones == 6
  end

  def next_turn(ending_cup_idx)
    cups[ending_cup_idx].empty? && (ending_cup_idx != 13 || ending_cup_idx != 6)
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].none?{|el| el.include?(:stone)} || cups[7..12].none?{|el| el.include?(:stone)}

  end

  def won?
    false
  end

  def winner
    won? ? @current_player.name : :draw

  end

  private

  attr_reader :name1, :name2, :current_player
end
