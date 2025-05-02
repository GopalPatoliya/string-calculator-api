class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delim = delimiter_line[2]
      delimiter = Regexp.escape(custom_delim)
    else
      delimiter = /,|\n/
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    nums.sum
  end
end