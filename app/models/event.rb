class Event < ActiveRecord::Base
  belongs_to :user

  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :time, presence: true
end
