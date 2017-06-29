module Heap
  # Heap Template
  class HeapTemplate
    attr_reader :elements

    def add(element)
      if element.is_a? Array
        element.each do |el|
          @elements.push el
          swim_up(count)
        end
      elsif defined? element.elements
        add element.elements
      else
        @elements.push element
        swim_up(count)
      end
    end

    def count
      @elements.length
    end

    def sort
      el_temp = @elements.clone
      result = []
      result.push extract_root! while count > 0
      @elements = el_temp
      result
    end

    protected

    def extract_root
      @elements[0]
    end

    def extract_root!
      swap(1, count)
      el = @elements.pop
      swim_down(1)
      el
    end

    def swap(index1, index2)
      temp = @elements[index1 - 1]
      @elements[index1 - 1] = @elements[index2 - 1]
      @elements[index2 - 1] = temp
    end
  end
end