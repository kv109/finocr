class MoneyNumberFinder < Struct.new(:text)

  DOLLAR_PATTERNS = [
      /\$[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?/,
      /[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?\$/
  ]

  PATTERNS = DOLLAR_PATTERNS

  def to_h
    hash           = {}
    i = -1
    hash[:matches] = matches.map do |match|
      i += 1
      start  = match.begin(0)
      stop   = match.end(0) - 1
      {
        id:             i,
        begin:          start,
        end:            stop,
        matched_string: match[0]
      }
    end
    hash
  end

  def matches
    PATTERNS.flat_map do |pattern|
      text.to_enum(:scan, pattern).map { Regexp.last_match }
    end
  end

end
