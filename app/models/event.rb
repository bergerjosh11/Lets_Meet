class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
