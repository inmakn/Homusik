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
    @countries = Country.all
    @cities = City.all
  end

  def create
    @ratio = Ratio.create(ratio_params)
    ratio_return = Lastfm.get_final_ratio(params[:ratio][:city], params[:ratio][:country], params[:ratio][:lastfm_username])
    if ratio_return.class == Array
      redirect_to geo_error_path
    else
      @ratio.ratio_output = ratio_return
      @ratio.user = current_user
      if @ratio.save
        redirect_to ratio_path(@ratio)
      else
        render :new
      end
    end
  end

    def destroy
      @ratio = Ratio.find(params[:id])
      if current_user && @ratio.user_id == session[:current_user]
        @ratio.destroy
        redirect_to ratios_path
      else
        redirect_to error_path
      end
    end

    private
    def ratio_params
      params.require(:ratio).permit(:lastfm_username, :country, :city)
    end

  end
