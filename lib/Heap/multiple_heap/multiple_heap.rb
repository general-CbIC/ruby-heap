module Heap
  module MultipleHeap
    # Multiple Heap template
    class MultipleHeap < HeapTemplate
      attr_reader :d

      protected

      def initialize(d, elements = [])
        @elements = []
        @d = d
        add(elements.pop) until elements.empty?
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