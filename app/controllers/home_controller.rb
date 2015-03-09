class HomeController < ApplicationController
  def search
    if params[:search].present?
      @pdfs = PdfSpike.search params[:search]
    else
      @pdfs = []
    end
  end
end
