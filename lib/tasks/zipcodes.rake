require 'CSV'

namespace :import do
  desc "Importing zipcodes"
  task zipcodes: :environment do
    parsed_zip_codes = CSV.read('./db/zipcodes.csv', headers: true) do |row|
      row.to_h
    end

    parsed_zip_codes.map do |zip_code|
      location = RGeo::Geographic.spherical_factory(:srid => 4326).point(zip_code["lng"].strip, zip_code["lat"].strip)

      ZipCode.create!(
        zip_code: zip_code["zip"],
        city: zip_code["city"],
        state: zip_code["state"],
        latitude: zip_code["lat"].strip,
        longitude: zip_code["lng"].strip,
        location: location
      )
    end
  end
end