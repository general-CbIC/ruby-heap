module Heap
  module BinaryHeap
    class MinHeap
      attr_reader :elements

      def initialize(elements = [])
        @elements = []
        add(elements.pop) until elements.empty?
      end

      def add(element)
        @elements.push element
        swim_up(count)
      end

      def count
        @elements.length
      end

      def extract_min
        @elements[0]
      end

      def extract_min!
        # TODO: to return and remove min element
      end

      private

      def swap(index1, index2)
        temp = @elements[index1 - 1]
        @elements[index1 - 1] = @elements[index2 - 1]
        @elements[index2 - 1] = temp
      end

      def swim_up(index)
        return if index == 1
        parent_index = (index / 2).floor
        return if @elements[parent_index - 1] <= @elements[index - 1]
        swap(parent_index, index)
        swim_up parent_index
      end
    end
  end
end