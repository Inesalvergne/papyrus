class Book < ApplicationRecord
  has_one_attached :cover_image

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
end
