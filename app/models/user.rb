class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  has_many :bookings
  has_many :shows, through: :bookings 
  validates :gender, presence: true, inclusion: { in: ["male","female"] }

  def gender_discount
  	self.gender.downcase == "female" ? 5 : 0
  end
end
