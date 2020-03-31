class CreateHebergements < ActiveRecord::Migration[5.2]
  def change
    create_table :hebergements do |t|
      t.string :name
      t.string :address
      t.integer :nbmax

      t.timestamps
    end
  end
end
