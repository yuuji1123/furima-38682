class RecordsAdressController < ApplicationController

  def index
  end
  
  def create
    @record = RecordAddress.new(record_params)
    if @record.save
      return redirect_to root_path
    else
      render 'orders/index'
    end

    private

  def record_params
    params.permit(:postcode, :ship_address_id, :city, :block, :building, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end
