class Location < ApplicationRecord
  has_many :votes

  COUNTRY_LIST = %w(U.S.A Canada D.R.C Belgium France U.K)

  validates_presence_of :country, :state, :city

  default_scope { where(active: true) }

  class << self

    def query(opts = {})
      loc = if opts[:city].present?
        where('city ILIKE ?', opts[:city])
      elsif opts[:state].present?
        where('state ILIKE ?', opts[:state])
      elsif opts[:country].present?
        where('country ILIKE ?', opts[:country])
      else
        all
      end
    end

    def all_locations(country = nil, state = nil, city = nil)
      loc = Location.all

      loc = loc.where(country: country) if country
      loc = loc.where(state: state) if state
      loc = loc.where(city: city) if city

      loc.pluck(:name).uniq
    end
  end
end
