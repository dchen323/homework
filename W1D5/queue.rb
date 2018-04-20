class Queue

  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end
