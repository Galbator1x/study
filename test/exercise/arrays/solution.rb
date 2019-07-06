module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = max(array)
        array.map { |num| num.positive? ? max_num : num }
      end

      def max(array)
        max_num = array.first
        array[1..-1].each do |num|
          max_num = num if num > max_num
        end
        max_num
      end

      def search(array, query)
        low = 0
        high = array.size - 1

        while low <= high
          mid = (low + high) / 2
          guess = array[mid]
          return mid if guess == query

          if guess > query
            high = mid - 1
          else
            low = mid + 1
          end
        end

        -1
      end
    end
  end
end
