class Freelancer < ApplicationRecord
  belongs_to :user

  # include PgSearch::Model
  # pg_search_scope :search_by_rate,
  # against: [ :rate ],
  # using: {
  #   tsearch: { prefix: false } 
  # }
end
