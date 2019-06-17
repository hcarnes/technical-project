class ZipCode < ActiveRecord::Base
  validates_presence_of :zip_code, :city, :state, :latitude, :longitude
end