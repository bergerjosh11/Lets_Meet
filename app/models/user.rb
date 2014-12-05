class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :events, as: :attachable, dependent: :destroy

  def posted?(event)
    listings.include?(event)
  end
end
