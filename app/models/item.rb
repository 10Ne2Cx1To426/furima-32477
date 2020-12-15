class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  
  validates :name, :text, :image, presence: true

  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end

  validates :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
end
