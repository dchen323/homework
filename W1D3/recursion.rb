require 'byebug'

def exp(b,n)
  return 1 if n == 0
  if n.even?
    exp(b,n/2) ** 2
  else
    b* (exp(b,(n-1)/2)**2)
  end
end

class Array
  def deep_dup
    array = []
    self.each do |el|
      array << el.is_a?(Array) ? el.deep_dup : el
        array << el.deep_dup
    end
    array
  end
end

def fib_help(n)
  array = []
  (n+1).times do |i|
    array << fibs(i)
  end
  array
end

def fibs(n)
  return 0 if n <= 0
  return 1 if n == 1

  fibs(n-1) + fibs(n - 2)

end

def bsearch(input, target)
  return nil if !input.include?(target)
  half = input.length / 2
  middle_el = input[half]
  if middle_el == target
    return half
  elsif middle_el > target
    bsearch(input[0...half],target)
  else
    half + bsearch(input[half..-1],target)
  end
end

# def merge_helper(*arr,&prc)
  # prc ||= Proc.new {|x,y| x <=> y}
# end

def merge_helper(arr1,arr2)
  single_arrays = []
  (arr1.length + arr2.length).times do

    if (arr1.first <=> arr2.first) == -1
      single_arrays << arr1.shift
    elsif(arr1.first <=> arr2.first) == 0
      single_arrays << arr2.shift << arr1.shift
    elsif arr1.empty?
      single_arrays << arr2.shift
    elsif arr2.empty?
      single_arrays << arr1.shift
    else
      single_arrays << arr2.shift
    end
  end
  single_arrays
end

def merge_sort(arr)
  return arr if arr.length <= 1
  half = arr.length / 2
  left_side = arr[0...half]
  right_side = arr[half..-1]

  merge_helper(merge_sort(left_side), merge_sort(right_side))


end

def subset_help
  answer = []

end

def subsets(array)
  return [[]] if array.empty?
  answer = []
  last_el = array.last
  subsets(array[0..-2]) + subsets(array[0..-2]).map {|el| el << last_el }
end

def factorial(num)
  return 1 if num == 1
  num * factorial(num-1)
end

def permutations(arr)
  ans = []
  return [arr] if arr.length == 1

  last_el = arr.last
  [arr] + permutations(arr[0...-1]).map.with_index do |el, idx|
    # debugger
    el.unshift(last_el)
  end

end

# p permutations([4,5,10])

def make_change(value,change=[25,10,5,1])
  ans = []
  if change.include?(value)
    ans << value
    value -= value
    return make_change(value , change)
  else
    return make_change(value , change)
  end
  ans
end

p make_change(39)
