# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Heap/version'

Gem::Specification.new do |spec|
  spec.name          = 'Heap'
  spec.version       = Heap::VERSION
  spec.authors       = ['Alexandr Sysoev']
  spec.email         = ['sanchous.ok@gmail.com']

  spec.summary       = 'Binary or multiple heap'
  spec.homepage      = 'https://github.com/pups3s/ruby-heap'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
