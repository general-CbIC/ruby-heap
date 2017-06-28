module Heap
  module BinaryHeap
    # Binary Heap template
    class BinaryHeap
      attr_reader :elements

      def initialize(elements = [])
        @elements = []
        add(elements.pop) until elements.empty?
      end

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

      def swap(index1, index2)
        temp = @elements[index1 - 1]
        @elements[index1 - 1] = @elements[index2 - 1]
        @elements[index2 - 1] = temp
      end

      def get_children(index)
        child1 = 2 * index
        child2 = 2 * index + 1
        children = {}
        children[@elements[child1 - 1]] = child1 unless @elements[child1 - 1].nil?
        children[@elements[child2 - 1]] = child2 unless @elements[child2 - 1].nil?
        children
      end
    end
  end
end