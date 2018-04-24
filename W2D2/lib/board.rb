require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
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
      raise ArgumentError if cups[start_pos].empty?
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    next_cup = start_pos
    cups[start_pos] = []
    until stones.empty?
      next_cup += 1
      next_cup = 0 if next_cup > 13
      if next_cup == 6 && current_player_name == name1
        cups[6] << stones.pop
      elsif next_cup == 13 && current_player_name == name2
        cups[13] << stones.pop
      else
        next if next_cup == 6 || next_cup == 13
        cups[next_cup] << stones.pop
      end
    end
    render
    next_turn(next_cup)

  end

  def next_turn(current_cup)
    return :prompt if current_cup == 6 || current_cup == 13
    return :switch if cups[current_cup].length == 1
    current_cup
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


  def winner
    name1_score = cups[6].count
    name2_score = cups[13].count
    if name1_score == name2_score
      :draw
    else
      return (name1_score > name2_score) ? name1 : name2
    end
  end

  private

  attr_reader :name1, :name2
end
