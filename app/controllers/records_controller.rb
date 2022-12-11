class RecordsController < ApplicationController

  def index
    @record_adress = RecordAdress.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @record_adress = RecordAdress.new(record_params)
    if @record_adress.valid?
      pay_item
       @record_adress.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    params.require(:record_adress).permit(:postcode, :ship_address_id, :city, :block, :building, :phone_number, :item_id)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'    
    )

  end

end
