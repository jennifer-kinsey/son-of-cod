class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, :price, :origin, :date_caught, :description, :presence => true
end
