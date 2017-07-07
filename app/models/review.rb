class Review < ActiveRecord::Base
  belongs_to :product
  validates :comment, :rating, :presence => true
end
