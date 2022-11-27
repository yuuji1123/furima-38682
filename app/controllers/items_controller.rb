class ItemsController < ApplicationController
  def index
    @itemss = Item.all
  end

  def destroy
  end

end
