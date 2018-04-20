class Stack
    attr_accessor :stack


    def initialize(stack=[])
      # create ivar to store stack here!
      @stack = stack
    end

    def add(el)
      # adds an element to the stack
      @stack << el
    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack.dup
    end


  end
