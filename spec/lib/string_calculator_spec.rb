require 'rails_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add("")).to eq(0)
    end

    it 'returns number for single number' do
      expect(described_class.add("5")).to eq(5)
    end

    it 'returns sum for two numbers' do
      expect(described_class.add("1,2")).to eq(3)
    end

    it 'handles multiple numbers' do
      expect(described_class.add("1,2,3,4")).to eq(10)
    end

    it 'supports newlines as delimiter' do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    it 'supports custom single-character delimiter' do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    it 'raises error for negative numbers' do
      expect {
        described_class.add("1,-2,3,-5")
      }.to raise_error("negative numbers not allowed -2,-5")
    end

    it 'ignores numbers > 1000' do
      expect(described_class.add("2,1001")).to eq(2)
    end

    it 'supports custom delimiter of any length' do
      expect(described_class.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple custom delimiters' do
      expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
