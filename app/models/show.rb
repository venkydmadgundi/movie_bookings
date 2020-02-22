class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  belongs_to :timing
  validates :show_date, presence: true
  validates :seat_price, presence: true, numericality: { greater_than: 0 }

  has_many :bookings
  has_many :users, through: :bookings
  validates :bookings, length: { maximum: 100 }

  before_save :validate_booking

  scope :theater_name, -> (name){ where(theater: Theater.find_by(name: name )) }

  def seats
  	100 - (self.bookings_count || 0)
  end

  private

  def validate_booking
    raise ArgumentError, 'Available seats for the show cannot be more than seats in theatre' if self.available_seats > self.theatre.seats
    raise ArgumentError, 'Available seats for the show cannot be less than zero' if self.available_seats < 0   
  end




end
