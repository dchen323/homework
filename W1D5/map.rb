class Map

  def initialize(array_map = Hash.new{|h,k| h[k] = 0})
    @array_map = array_map
  end

  def assign(key,value)
    @array_map[key] = value
  end

  def lookup(key)
    @array_map.select do |array|
      array.first == key
    end
  end

  def remove(key)
    @array_map.delete_if{|k,_| k==key}
  end

  def show
    @array_map.to_a
  end
end
