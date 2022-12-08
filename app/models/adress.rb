class Adress < ApplicationRecord
  belongs_to :record


  validates :postcode, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_address
end
