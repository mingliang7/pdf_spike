class PdfSpikesController < ApplicationController
  def index
    @pdfs = PdfSpike.all
  end
  def new
    @pdf= PdfSpike.new
  end
  def create
    @pdf= PdfSpike.new(pdf_spike_params)
    if @pdf.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @pdf = PdfSpike.find(params[:id])
  end

  private
  def pdf_spike_params
    params.require(:pdf_spike).permit(:title,:detail,:text)
  end
end
