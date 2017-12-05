class Location < ApplicationRecord
  has_many :votes

  COUNTRY_LIST = %w(U.S.A Canada D.R.C Belgium France U.K)

  validates_presence_of :country, :state, :city

  default_scope { where(active: true) }

  class << self
    def all_countries
      Location.all.pluck(:country).uniq
    end

    def all_states(country = nil)
      loc = Location.all

      loc = Location.where(country: country) if country

      loc.pluck(:state).uniq
    end

    def all_cities(country = nil, state = nil)
      loc = Location.all

      loc = Location.where(country: country) if country
      loc = Location.where(state: state) if state

      loc.pluck(:city).uniq
    end

    def all_locations(country = nil, state = nil, city = nil)
      loc = Location.all

      loc = loc.where(country: country) if country
      loc = loc.where(state: state) if state
      loc = loc.where(ciy: city) if city

      loc.pluck(:name).uniq
    end
  end
end
