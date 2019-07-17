class AddPointToZipCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :zip_codes, :location, :point
  end
end
