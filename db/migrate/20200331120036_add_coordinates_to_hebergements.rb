class AddCoordinatesToHebergements < ActiveRecord::Migration[5.2]
  def change
    add_column :hebergements, :latitude, :float
    add_column :hebergements, :longitude, :float
  end
end
