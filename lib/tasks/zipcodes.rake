require 'CSV'

namespace :import do
  desc "Importing zipcodes"
  task zipcodes: :environment do
    parsed_zip_codes = CSV.read('./db/zipcodes.csv', headers: true) do |row|
      row.to_h
    end

    parsed_zip_codes.map do |zip_code|
      ZipCode.create!(
        zip_code: zip_code["zip"],
        city: zip_code["city"],
        state: zip_code["state"],
        latitude: zip_code["lat"],
        longitude: zip_code["lng"],
        location: "POINT(#{zip_code["lng"]} #{zip_code["lat"]})"
      )
    end
  end
end