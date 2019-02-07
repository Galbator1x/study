module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select { |film| film['country']&.split(',').to_a.size >= 2 }
                              .select { |film| film['rating_kinopoisk'].to_f.positive? }
        sum_of_ratings = filtered_films.inject(0) { |a, e| a + e['rating_kinopoisk'].to_f }
        sum_of_ratings / filtered_films.size
      end

      def chars_count(films, threshold)
        searched_char = 'и'
        filtered_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        filtered_films.inject(0) { |a, e| a + e['name'].count(searched_char) }
      end
    end
  end
end
