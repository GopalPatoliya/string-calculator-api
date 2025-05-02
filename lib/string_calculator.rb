class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/ # default

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      
      if delimiter_line.include?("[")
        # Support multiple and long delimiters
        delimiters = delimiter_line.scan(/\[([^\]]+)\]/).flatten
        delimiter = Regexp.new(delimiters.map { |d| Regexp.escape(d) }.join("|"))
      else
        delimiter = Regexp.new(Regexp.escape(delimiter_line[2]))
      end
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.reject { |n| n > 1000 }.sum
  end
end
