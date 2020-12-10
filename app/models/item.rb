class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  
  validates :name, :text, :price, presence: true

  validates :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 1 } 
end
