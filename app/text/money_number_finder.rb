class MoneyNumberFinder < Struct.new(:text)

  def matches
    text.scan(/\d+/)
  end

end
