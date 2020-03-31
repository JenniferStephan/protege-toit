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

end
