class PdfSpikesController < ApplicationController
  before_action :set_pdfSpike, only: [:show, :edit, :update, :destroy]
  def index
    @pdfs = PdfSpike.all
  end
  def new
    @pdf= PdfSpike.new
  end
  def edit
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
  end
  def update
    if @pdf.update(pdf_spike_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @pdf.destroy
    redirect_to pdf_spikes_path
  end
  private
  def set_pdfSpike
    @pdf = PdfSpike.find(params[:id])
  end
  def pdf_spike_params
    params.require(:pdf_spike).permit(:title,:detail,:text)
  end
end
