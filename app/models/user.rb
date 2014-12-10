class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :events

  has_many :attendances
  has_many :attendanced_events, through: :attendances, source: :events

  def attend!(event)
    attendanced_events << event
  end

  def unattend(event)
    attendanced_events.destroy(user)
  end
end
