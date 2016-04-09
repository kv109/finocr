class DocsController < ApplicationController

  def new
  end

  def create
    pdf_data = PdfData.new(params[:file].tempfile)

    render plain: pdf_data.pages.first.text
  end

end
