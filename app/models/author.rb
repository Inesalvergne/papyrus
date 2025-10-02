class Author < ApplicationRecord
  has_one_attached :headshot

  has_many :authorships, dependent: :destroy
  has_many :books, through: :authorships
end
