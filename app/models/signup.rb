class Signup < ApplicationRecord
  validates :time, numericality: { greater_than: 0, less_than: 24 }

  belongs_to :camper
  belongs_to :activity
end
