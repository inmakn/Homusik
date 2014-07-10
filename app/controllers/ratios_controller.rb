class RatiosController < ApplicationController

  before_action :authenticate?, only: [:new, :create]

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
    @ratio = Ratio.new(ratio_params)
    if @ratio.save
      redirect_to ratios_path
    else
      render :new
    end
    #API call?
  end

  def destroy
    @ratio = Ratio.find(params[:id])
    if current_user && @ratio.user_id == session[:current_user]
      @ratio.destroy
      redirect_to ratios_path
    elsif current_user && @ratio.user_id != session[:current_user]
      redirect_to wrong_user_path
    else
      redirect_to error_path
    end
  end

  private
  def ratio_params
    params.require(:ratio).permit(
    :lastfm_username_entry,
    :country_entry, :city_entry
    )
  end

end
