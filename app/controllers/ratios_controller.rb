class RatiosController < ApplicationController

  before_action :authenticate?, only: [:new, :create, :destroy]

  def index
    @ratios = Ratio.all
  end

  def show
    @ratio = Ratio.find(params[:id])
  end

  def new
    @ratio = Ratio.new
  end

  def create
    #API call
  end

  def destroy
    @ratio = Ratio.find(params[:id])
    @ratio.destroy
    redirect_to ratios_path
  end

  private
  def ratio_params
    params.require(:ratio).permit(
    :lastfm_username_entry,
    :country_entry, :city_entry
    )
  end

end
