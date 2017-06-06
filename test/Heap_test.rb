require 'test_helper'

class HeapTest < Minitest::Test
  def test_version?
    refute_nil ::Heap::VERSION
  end

  def test_binary_min_heap_count
    b_heap = Heap::BinaryHeap::MinHeap.new([3, 2, 5, 7])
    assert_equal 4, b_heap.count
  end

  def test_binary_min_heap_add_and_min
    b_heap = Heap::BinaryHeap::MinHeap.new([3, 2, 5, 7])
    b_heap.add 1
    assert_equal 5, b_heap.count
    assert_equal 1, b_heap.extract_min
  end
end
