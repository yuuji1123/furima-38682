class Adress < ApplicationRecord
  belongs_to :record



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_address
end
