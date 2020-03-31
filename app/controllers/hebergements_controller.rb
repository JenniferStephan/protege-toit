class HebergementsController < ApplicationController

  def index
    @hebergements = Hebergement.geocoded # returns hebergements with coordinates

    @markers = @hebergements.map do |hebergement|
      {
        lat: hebergement.latitude,
        lng: hebergement.longitude
      }
    end
  end

  def show
    @hebergement = Hebergement.find(params[:id])
  end

  def new
    @hebergement = Hebergement.new
  end

  def create
    @hebergement = Hebergement.new(heb_params)
    if @hebergement.save
      redirect_to root_path
    else
      render :new
    end
  end

private

def heb_params
    params.require(:hebergement).permit(:name, :address, :nbmax)
end

end
