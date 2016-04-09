class PdfPageData

  attr_reader :text, :number

  def initialize(text:, number: )
    @text = text
    @number = number
  end

  def money_numbers
    MoneyNumberFinder.new(text).matches
  end

end
