class PdfPageData

  attr_reader :text, :number

  def initialize(text:, number: )
    @text = text
    @number = number
  end

  def money_number_finder
    MoneyNumberFinder.new(text)
  end

  def html_with_highlighted_matches(matches = money_number_finder.to_h.fetch(:matches))
    html = text.dup

    wrapper_right = '</span>'
    added_chars = 0

    matches.each do |hash|
      start = hash.fetch(:begin)
      stop  = hash.fetch(:end)

      wrapper_left = <<HTML
<span class="highlight" data-match-id="#{hash.fetch(:id)}">
HTML

      html.insert(start + added_chars, wrapper_left)
      added_chars += wrapper_left.length
      html.insert(stop + 1 + added_chars, wrapper_right)
      added_chars += wrapper_right.length
    end
    html.html_safe
  end

end
