class PdfData < Struct.new(:pdf_file)

  def pages
    pages = []

    pdf_reader.pages.each_with_index do |page, index|
      pages << PdfPageData.new(text: page.text, number: index + 1)
    end

    pages
  end

  def pdf_reader
    @pdf_reader ||= PDF::Reader.new(pdf_file)
  end

end
