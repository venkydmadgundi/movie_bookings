class Timing < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  has_many :shows
end
