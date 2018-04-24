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
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    next_cup = start_pos
    cups[start_pos] = []
    until stones.empty?
      next_cup += 1
      next_cup = 0 if next_cup > 13
      if next_cup == 6
        cups[6] << stones.pop if current_player_name == name1
      elsif next_cup == 13
        cups[13] << stones.pop if current_player_name == name2
      else
        cups[next_cup] << stones.pop
      end
    end
    render
    next_turn(next_cup)

  end

  def next_turn(ending_cup_idx)

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

  end

  private

  attr_reader :name1, :name2
end
