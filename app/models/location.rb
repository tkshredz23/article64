class Location < ApplicationRecord
  has_many :votes

  COUNTRY_LIST = %w(U.S.A Canada D.R.C Belgium France U.K)

  validates_presence_of :country, :state, :city
end
