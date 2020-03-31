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
    @hebergement.user = current_user
    if @hebergement.save
      redirect_to hebergement_path(@hebergement)
    else
      render :new
    end
  end

private

def heb_params
    params.require(:hebergement).permit(:name, :address, :nbmax)
end

end
