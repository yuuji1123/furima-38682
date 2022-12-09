class RecordsController < ApplicationController

  def index
    @record = Record.new(record_params)
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
       @record_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def record_params
    params.permit(:postcode, :ship_address_id, :city, :block, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
