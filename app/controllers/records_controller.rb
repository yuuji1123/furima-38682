class RecordsController < ApplicationController

  def index
    @record_adress = RecordAdress.new(record_params)
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @record_adress = RecordAdress.new(record_params)
    if @record_adress.valid?
       @record_adress.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    params.permit(:postcode, :ship_address_id, :city, :block, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
