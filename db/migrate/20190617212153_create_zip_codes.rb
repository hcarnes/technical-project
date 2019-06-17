class CreateZipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
