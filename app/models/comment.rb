class Comment < ApplicationRecord

  validates :comment,
    length: { maximum: 500 }

  belongs_to :user, optional: true
  has_many :image, foreign_key: 'id'
end
