class ItemsController < ApplicationController
  def index
    @itemss = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:item_id, :image).merge(user_id: current_user.id)
  end
end
