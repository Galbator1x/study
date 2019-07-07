module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        func = ->(_, element) { yield(element) }

        my_reduce(MyArray.new([]), &func)
        self
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(acc, element) { acc << yield(element) }

        my_reduce(MyArray.new([]), &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, element) { element.nil? ? acc : acc << element }

        my_reduce(MyArray.new([]), &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        iter = lambda do |acc, array|
          return acc if array.size.zero?

          first, *rest = *array
          acc = yield(acc, first)
          iter.call(acc, rest)
        end

        initial_array = initial.nil? ? self[1..-1] : self
        acc = initial || first
        iter.call(acc, initial_array)
      end
    end
  end
end
