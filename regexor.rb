
# def exactly_three_chars(animals)
#   matches = []
#   animals.each do |animal|
#     if animal.match(/^[a-z]{3}$/i)   #i signifies case-insensitive
#       matches << animal
#     end
#   end
#   matches
# end
# class Regexor
#   class << self
#     def filter_png(files)
#       %w{file2.png}
#     end
#   end
# end

class Regexor
  class << self
    def filter_png(files)
      matches = []
      files.each do |file|
        if file.match(/\.png$/)
          matches << file
        end
      end
      matches
    end

    def exactly_three_chars(animals)
      animals.delete_if do |animal|
        !animal.match(/^[a-z]{3}$/i)
      end
    end

    def does_not_start_with_b(names)
      names.delete_if do |name|
        name.match(/^b/i)
      end
    end

    def no_bees(names)
      names.delete_if do |name|
        name.match(/b/i)
      end
    end
  end
end


class TestRegexor < Minitest::Test
  def test_filter_png
    files = %w{file1.jpg file2.png file3.gif}
    assert_equal %w{file2.png}, Regexor.filter_png(files)
  end

  def text_exactly_three_chars
    animals = %w{pig bear lion}
    assert_equal %w{Pig}, Regexor.exactly_three_chars(animals)
  end

  def test_does_not_start_with_b
    names = %w{Barbara Abby Margarita}
    assert_equal %w{Abby Margarita}, Regexor.does_not_start_with_b(names)
  end

  def method_name
    names = %w{Barbara Abby Margarita}
    assert_equal %w{Margarita}, Regexor.no_bees(names)
  end
end
