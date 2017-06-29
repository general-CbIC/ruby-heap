module Heap
  module BinaryHeap
    # Binary Heap template
    class BinaryHeap < HeapTemplate

      protected

      def initialize(elements = [])
        @elements = []
        add(elements.pop) until elements.empty?
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