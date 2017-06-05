module Heap
  module HelloWorld
    class Alloha

      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def generate_alloha
        "Alloha, #{@name}!"
      end

      def say_alloha
        puts generate_alloha
      end
    end
  end
end