class Book < ApplicationRecord
  include PgSearch::Model

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
  has_many :readings, dependent: :destroy
  has_many :users, through: :readings

  has_one_attached :cover_image

  pg_search_scope :search_by_title_and_authors,
                  against: :title,
                  associated_against: {
                    authors: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def display_authors
    authors.map(&:full_name).join(", ")
  end
end
