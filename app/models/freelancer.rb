class Freelancer < ApplicationRecord
  belongs_to :user, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_rate,
  against: [ :rate ],
  using: {
    tsearch: { prefix: false } 
  }
end
