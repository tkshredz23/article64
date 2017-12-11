class Candidate < ApplicationRecord
  has_many :votes

  def candidate_name
    "#{first_name} #{last_name}"
  end
end
