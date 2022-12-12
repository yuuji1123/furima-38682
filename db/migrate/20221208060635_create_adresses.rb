class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string     :postcode,         null: false
      t.string     :ship_address_id,  null: false, foreign_key: true 
      t.string     :city,             null: false
      t.string     :block,            null: false
      t.string     :building 
      t.string     :phone_number,     null: false
      t.references :record,           null: false , foreign_key: true
      t.timestamps
    end
  end
end
