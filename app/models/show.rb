class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  belongs_to :timing
end
