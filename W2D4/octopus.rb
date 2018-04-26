require 'byebug'

  def sluggish(array)
    array.each_with_index do |fish,idx|
      max_length = true
      # debugger
      array.each_with_index do |fish2,idx2|
        next if idx == idx2
        max_length = false if fish2.length > fish.length
      end
      return fish if max_length
    end
  end

  def dominant(array)
    prc = Proc.new {|x,y|y.length <=> x.length}
    array.merge_sort(&prc).first
  end

  def clever(array)
    array.inject do |accumulator, el|
      if accumulator.length < el.length
        el
      else
        accumulator
      end
    end
  end


def slow_dance(dir, array)
  array.each_with_index do |el, idx|
    return idx if el == dir
  end
end

def constant_dance(dir,array)
  tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7
  }

  tiles_hash[dir]
end

class Array

  def merge_sort(&prc)

    return self if count <= 1

    midpoint = count / 2
    sorted_left = take(midpoint).merge_sort(&prc)
    sorted_right = drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right

  end
end

if __FILE__== $0
  fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  p dominant(fish_array)+"-------------"
  p sluggish(fish_array)+"------"
  p clever(fish_array)+ "--"
  p slow_dance("right",tiles_array)
  p constant_dance("left-down",tiles_array)

end
