require 'CSV'

namespace :import do
  desc "Importing zipcodes"
  task zipcodes: :environment do
    CSV.foreach('./db/zipcodes.csv', headers: [:zip_code, :city, :state, :latitude, :longitude]) do |row|
      ZipCode.create(row.to_h)
    end
  end
end
