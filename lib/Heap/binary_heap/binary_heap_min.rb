module Heap
  module BinaryHeap
    # Binary Heap with min root
    class MinHeap < BinaryHeap
      def extract_min
        @elements[0]
      end

      def extract_min!
        swap(1, count)
        el = @elements.pop
        swim_down(1)
        el
      end

      def sort
        el_temp = @elements.clone
        result = []
        result.push extract_min! while count > 0
        @elements = el_temp
        result
      end

      private

      def swim_up(index)
        return if index == 1
        parent_index = index / 2
        return if @elements[parent_index - 1] <= @elements[index - 1]
        swap(parent_index, index)
        swim_up parent_index
      end

      def swim_down(index)
        children = get_children(index)
        return if children.empty?
        max_child = children.min
        return if @elements[index - 1] <= max_child[0]
        swap index, max_child[1]
        swim_down max_child[1]
      end
    end
  end
end