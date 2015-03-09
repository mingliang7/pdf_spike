class PdfSpikesController < ApplicationController
  def index
    @pdfs = PdfSpike.all
   end

  def show
    @pdf = PdfSpike.find(params[:id])
  end
end
