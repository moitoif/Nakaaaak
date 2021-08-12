class Comment < ApplicationRecord
  belongs_to :user, optional: true
  has_many :image, foreign_key: 'id'
end
