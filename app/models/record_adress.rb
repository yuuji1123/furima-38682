class RecordAdress

  include ActiveModel::Model
  attr_accessor :postcode, :ship_address_id, :city, 
  :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ , message: "is invalid."}
    validates :token
  end

  validates :ship_address_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Adress.create(postcode: postcode, ship_address_id: ship_address_id, city: city, block: block, 
      building: building, phone_number: phone_number, record_id: record.id)
  end


end