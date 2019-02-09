module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        iter = lambda do |array|
          return self if array.size.zero?

          yield array.first
          new_array = array[1..-1]
          iter.call(new_array)
        end

        iter.call(self)
      end

      # Написать свою функцию my_map
      def my_map
        iter = lambda do |acc, array|
          return acc if array.size.zero?

          acc << yield(array.first)
          new_array = array[1..-1]
          iter.call(acc, new_array)
        end

        iter.call(MyArray.new([]), dup)
      end

      # Написать свою функцию my_compact
      def my_compact
        iter = lambda do |acc, array|
          return acc if array.size.zero?

          acc << array.first unless array.first.nil?
          new_array = array[1..-1]
          iter.call(acc, new_array)
        end

        iter.call(MyArray.new([]), self)
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        iter = lambda do |acc, array|
          return acc if array.size.zero?

          acc = yield(acc, array.first)
          new_array = array[1..-1]
          iter.call(acc, new_array)
        end

        initial_array = initial.nil? ? self[1..-1] : self
        acc = initial || first
        iter.call(acc, initial_array)
      end
    end
  end
end
