class PdfData

  def initialize(pdf_file)
    @pdf_file = pdf_file
    @pdf_reader = PDF::Reader.new(pdf_file)
  rescue PDF::Reader::MalformedPDFError
    raise MalformedPDFError
  end

  def pages
    pages = []

    @pdf_reader.pages.each_with_index do |page, index|
      pages << PdfPageData.new(text: page.text, number: index + 1)
    end

    pages
  end

  class MalformedPDFError < StandardError; end
end
