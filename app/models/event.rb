class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, through: :attendanced_events, source: :user
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
