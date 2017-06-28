module Heap
  module MultipleHeap
    # Multiple Heap template
    class MultipleHeap
      attr_reader :elements
      attr_reader :d

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

      protected

      def initialize(d, elements = [])
        @elements = []
        @d = d
        add(elements.pop) until elements.empty?
      end
      
      def swap(index1, index2)
        temp = @elements[index1 - 1]
        @elements[index1 - 1] = @elements[index2 - 1]
        @elements[index2 - 1] = temp
      end

      def get_children(index)
        child_indexes = []
        (2..(@d + 1)).each { |i| child_indexes.push((index - 1) * @d + i) }
        child_indexes.delete_if { |ind| ind > count }
        return if child_indexes.empty?

        children = {}
        child_indexes.each { |ind| children[@elements[ind - 1]] = ind }
        children
      end
    end
  end
end