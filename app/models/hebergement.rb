class Hebergement < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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
