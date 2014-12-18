class Location < ActiveRecord::Base
  has_many :users
  geocoded_by :city
  after_validation :geocode
end
