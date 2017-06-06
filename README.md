# Heap

Gem is using for making Heaps (binary only for now).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-heap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-heap

## Usage

#### Binary Heap with min root
```ruby
require 'Heap'

# Initialize
b_heap = Heap::BinaryHeap::MinHeap.new([2, 3, 1, -1])

b_heap.elements     # [-1, 1, 3, 2]
b_heap.count        # 4
b_heap.extract_min  # -1; Only show min element
b_heap.extract_min! # Show and remove it!
b_heap.count        # 3
b_heap.elements     # [1, 2, 3]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [Project page](https://github.com/pups3s/ruby-heap). This project is intended to be a safe, welcoming space for collaboration.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
