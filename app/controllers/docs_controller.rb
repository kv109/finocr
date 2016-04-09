class DocsController < ApplicationController

  def new
  end

  def create
    @pdf_data = PdfData.new(params[:file].tempfile)
    render :show
  rescue PdfData::MalformedPDFError
    flash.now[:error] = 'File has to be in PDF format'
    render :new
  end

  def show
    @pdf_data = PdfData.new(Rails.root.join('db', 'documents', 'example4.pdf'))
  end
end
