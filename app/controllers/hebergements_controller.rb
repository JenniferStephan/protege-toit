class HebergementsController < ApplicationController

  def index
    @hebergements = Hebergement.geocoded # returns flats with coordinates

    @markers = @hebergements.map do |heb|
      {
        lat: heb.latitude,
        lng: heb.longitude
      }
    end
end

end
