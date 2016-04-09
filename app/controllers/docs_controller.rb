class DocsController < ApplicationController

  def new
  end

  def create
    reader = PDF::Reader.new(params[:file].tempfile)

    pages = []
    reader.pages.each do |page|
      pages << page.text
    end

    render plain: pages.first
  end

end
