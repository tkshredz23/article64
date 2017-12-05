class Vote < ApplicationRecord
  belongs_to :candidate
  belongs_to :location

  validates_presence_of :candidate, :location
end
