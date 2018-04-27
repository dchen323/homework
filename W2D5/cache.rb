
class LRUCache

    attr_reader :size

    def initialize(size)
      @size = size
      @stack = []
    end

    def count
      @stack.length
    end

    def add(el)
      if @stack.include?(el)
        @stack.delete(el)
        @stack << el
      else
        if @stack.count == size
          @stack.shift
          @stack << el
        else
          @stack << el
        end
      end
    end

    def show
      p @stack
    end

    private
    # helper methods go here!

  end
