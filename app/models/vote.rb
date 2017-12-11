class Vote < ApplicationRecord
  belongs_to :candidate
  belongs_to :location

  validates_presence_of :candidate, :location

  delegate :candidate_name, to: :candidate

  class << self
    def by_location(ids)
      votes = Vote.where(location: ids)

      total_count = (votes.sum(:online_count) + votes.sum(:offline_count)).to_f

      votes.group_by(&:candidate).map do |candidate, votes|
        {}.tap do |vote|
          vote[:candidate] = candidate
          vote[:offline] = votes.map(&:offline_count).reduce(:+)
          vote[:online] = votes.map(&:online_count).reduce(:+)
          vote[:total] = vote[:offline] + vote[:online]
          vote[:percentage] = (vote[:total].to_f / total_count * 100).round(2)
        end
      end
    end
  end
end
