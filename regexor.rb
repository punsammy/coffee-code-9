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
  end
end


class TestRegexor < Minitest::Test
  def test_filter_png
    files = %w{file1.jpg file2.png file3.gif}
    assert_equal %w{file2.png}, Regexor.filter_png(files)
  end
end
