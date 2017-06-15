module Heap
  module BinaryHeap
    class MaxHeap
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
        else
          @elements.push element
          swim_up(count)
        end
      end

      def count
        @elements.length
      end

      def extract_max
        @elements[0]
      end

      def extract_max!
        swap(1, count)
        el = @elements.pop
        swim_down(1)
        el
      end

      def sort
        el_temp = @elements.clone
        result = []
        result.push extract_max! while count > 0
        @elements = el_temp
        result
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
        return if @elements[parent_index - 1] >= @elements[index - 1]
        swap(parent_index, index)
        swim_up parent_index
      end

      def swim_down(index)
        child1_index = 2 * index
        child2_index = 2 * index + 1
        return if @elements[child1_index - 1].nil? && @elements[child2_index - 1].nil?
        if @elements[child2_index - 1].nil?
          return if @elements[child1_index - 1] <= @elements[index - 1]
          swap(index, child1_index)
          swim_down(child1_index)
        else
          if @elements[child2_index - 1] <= @elements[index - 1] && @elements[child1_index - 1] <= @elements[index - 1]
            return
          elsif @elements[child2_index - 1] > @elements[index - 1] && @elements[child1_index - 1] > @elements[index - 1]
            if @elements[child2_index - 1] > @elements[child1_index - 1]
              swap(child2_index, index)
              swim_down(child2_index)
            else
              swap(child1_index, index)
              swim_down(child1_index)
            end
          elsif @elements[child2_index - 1] > @elements[index - 1]
            swap(child2_index, index)
            swim_down(child2_index)
          elsif @elements[child1_index - 1] > @elements[index - 1]
            swap(child1_index, index)
            swim_down(child1_index)
          end
        end
      end
    end
  end
end