class Map

  attr_accessor :array_map

  def initialize(array_map = [])
    @array_map = array_map
  end

  def assign(key,value)
    key_made = @array_map.index {|values| values.first == key}
    key_made ? @array_map[key_made][1] = value : @array_map << [key,value]
  end

  def lookup(key)
    @array_map.each do |pairs|
      return pairs.last if pairs.first == key
    end
  end

  def remove(key)
    @array_map.each do |pairs|
      @array_map.delete(pairs) if pairs.first == key
    end
  end

  def show
    @array_map.dup
  end
end
