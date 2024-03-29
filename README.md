# Heap (ruby heapsort)

[![Gem Version](https://badge.fury.io/rb/ruby-heap.svg)](https://badge.fury.io/rb/ruby-heap)
![Build workflow](https://github.com/general-CbIC/ruby-heap/actions/workflows/build.yml/badge.svg)
[![Gem](https://img.shields.io/gem/dt/ruby-heap.svg)](https://rubygems.org/gems/ruby-heap)
[![Code Climate](https://codeclimate.com/github/pups3s/ruby-heap/badges/gpa.svg)](https://codeclimate.com/github/pups3s/ruby-heap)

[Русская версия](README_ru.md)

# Heap (ruby heapsort)
Gem is used to create Heap structs and sort via [Heapsort algorithm](https://en.wikipedia.org/wiki/Heapsort).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-heap'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install ruby-heap
```

## Usage

### Binary Heaps

#### Binary Heap with min root

While Heap initialize you can add any comparable object in it (not numbers only).
Objects must have compare functions (>, >=, <, <=).

```ruby
require 'Heap'

# Initialize
b_heap = Heap::BinaryHeap::MinHeap.new([2, 3, 1, -1])

# Return elements in Heap (read access only)
b_heap.elements     # [-1, 1, 3, 2]

# Return sorted array (heap-sort) without
# changing elements in heap
b_heap.sort         # [-1, 1, 2, 3]

# Count of elements in Heap
b_heap.count        # 4

# Return min element without removing from Heap
b_heap.extract_min  # -1

# Return min element and remove it from Heap
b_heap.extract_min! # -1
b_heap.count        # 3
b_heap.elements     # [1, 2, 3]

# Also you can add elements with "add" function
b_heap.add -1
b_heap.elements     # [-1, 1, 3, 2]
b_heap.add [0, 9, 200, -15, 6]
b_heap.elements     # [-15, -1, 3, 0, 1, 9, 200, 2, 6]
b_heap.sort         # [-15, -1, 0, 1, 2, 3, 6, 9, 200]
```

#### Same practice with max root

```ruby
require 'Heap'

# Initialize
b_heap = Heap::BinaryHeap::MaxHeap.new([2, 3, 1, -1])

# Return elements in Heap (read access only)
b_heap.elements     # [3, 2, 1, -1]

# Return sorted array (heap-sort) without
# changing elements in heap
b_heap.sort         # [3, 2, 1, -1]

# Count of elements in Heap
b_heap.count        # 4

# Return max element without removing from Heap
b_heap.extract_max  # 3

# Return max element and remove it from Heap
b_heap.extract_max! # 3
b_heap.count        # 3
b_heap.elements     # [2, -1, 1]

# Also you can add elements with "add" function
b_heap.add -1
b_heap.elements     # [2, -1, 1, -1]
b_heap.add [0, 9, 200, -15, 6]
b_heap.elements     # [200, 6, 9, 0, -1, 1, 2, -15, -1]
b_heap.sort         # [200, 9, 6, 2, 1, 0, -1, -1, -15]
```

#### Heap merging

```ruby
require 'Heap'

# Initialize heaps
min_heap = Heap::BinaryHeap::MinHeap.new [1, 2, 3]
max_heap = Heap::BinaryHeap::MaxHeap.new [9, -1, 4]

# Merge heaps
min_heap.add max_heap

min_heap.count    # 6
min_heap.sort     # [-1, 1, 2, 3, 4, 9]
```

### Multiple Heaps

Multiple (d-ary) heaps have **same methods as binary**. But initialize differs:

```ruby
require 'Heap'

# First param is "d" of heap
# Second param is optional and can contain first elements
min_heap = Heap::MultipleHeap::MinHeap.new(5, [10, 20, 30])
max_heap = Heap::MultipleHeap::MaxHeap.new(7)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [Project page](https://github.com/pups3s/ruby-heap).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
