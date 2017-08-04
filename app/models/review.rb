class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :product
  validates :user, :product, :description, :rating, presence: true
end
