class ItemsController < ApplicationController
  def index
    @itemss = Item.all
  end
end
