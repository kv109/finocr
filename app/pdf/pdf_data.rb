class PdfData < Struct.new(:pdf_file)

  def pages
    pdf_reader.pages.map do |page|
      PdfPageData.new(text: page.text)
    end
  end

  def pdf_reader
    @pdf_reader ||= PDF::Reader.new(pdf_file)
  end

end
