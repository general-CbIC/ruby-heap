module Heap
  module MultipleHeap
    class MaxHeap
      attr_reader :elements
      attr_reader :d

      def initialize(d, elements = [])
        @elements = []
        @d = d
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
        parent_index = ((index + 1) / @d).floor
        return if @elements[parent_index - 1] >= @elements[index - 1]
        swap(parent_index, index)
        swim_up parent_index
      end

      def swim_down(index)
        child_indexes = []
        (2..(@d + 1)).each { |i| child_indexes.push((index - 1) * @d + i) }
        child_indexes.delete_if { |ind| ind > count }
        return if child_indexes.empty?

        max_i = 0
        max_el = @elements[child_indexes[0] - 1]
        child_indexes.each do |ind|
          next if ind.zero?
          if max_el < @elements[ind - 1]
            max_i = ind
            max_el = @elements[ind - 1]
          end
        end

        return if @elements[index - 1] >= @elements[max_i - 1]
        swap index, max_i
        swim_down max_i
      end
    end
  end
end