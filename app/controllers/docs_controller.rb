class DocsController < ApplicationController

  def new
  end

  def create
    @pdf_data = PdfData.new(params[:file].tempfile)
    render :show
  end

end
