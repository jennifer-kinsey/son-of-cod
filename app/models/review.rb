class Review < ActiveRecord::Base
  belongs_to :products
  validates :comment, :rating, :presence => true
end
