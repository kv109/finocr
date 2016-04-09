require 'rails_helper'
require 'pp'

describe MoneyNumberFinder do

  describe '#to_h' do
    context 'empty string' do
      it do
        test_match '', []
      end
    end

    context 'there are numbers but no dollar sign' do
      it do
        test_match '123', []
        test_match '123,456', []
        test_match '123,456.00', []
      end
    end

    context 'one occurrence' do
      it do
        test_match '$000', [[0, 3, '$000']]
        test_match '$123', [[0, 3, '$123']]
        test_match '$123,456', [[0, 7, '$123,456']]
        test_match '$123,456.78', [[0, 10, '$123,456.78']]
        test_match 'abc $123,456.78', [[4, 14, '$123,456.78']]
        test_match '$123,456.78 abc', [[0, 10, '$123,456.78']]
        test_match 'abc $123,456.78 abc', [[4, 14, '$123,456.78']]
      end
    end

    context 'many occurrences' do
      it do
        test_match '$111 $222', [[0, 3, '$111'], [5, 8, '$222']]
        test_match 'abcd $111 defg $222', [[5, 8, '$111'], [15, 18, '$222']]
        test_match 'abcd $111,222,333.44 defg $777,666,555.44', [[5, 19, '$111,222,333.44'], [26, 40, '$777,666,555.44']]
      end
    end
  end

  def test_match(text, array)
    result = described_class.new(text).to_h.fetch(:matches)
    expect(result).to eql array.map(&method(:arr_to_hash))
  end

  def arr_to_hash(arr)
    { begin: arr[0], end: arr[1], matched_string: arr[2] }
  end

end
