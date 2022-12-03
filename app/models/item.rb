class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true,
   numericality: {only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :ship_address_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_address
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_day
end
