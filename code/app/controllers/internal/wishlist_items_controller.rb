class Internal::WishlistItemsController < ApplicationController
  before_action :initialize_wishlist_item, only: %i[edit show]

  def show
  end

  def index
    @wishlist_items = WishlistItem.all
  end

  def new
    @wishlist_item = WishlistItem.new
  end

  def create
    @wishlist_item = WishlistItem.new(permitted_params)

    if @wishlist_item.save
      redirect_to internal_wishlist_items_path, notice: 'The instrument was successfully added to the wishlist.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @wishlist_item = WishlistItem.find(params[:id])

    if @wishlist_item.update(permitted_params)
      redirect_to internal_wishlist_items_path, notice: 'The wishlist instrument was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    redirect_to internal_wishlist_items_path, notice: 'The instrument was successfully removed from the wishlist.'
  end

  def initialize_wishlist_item
    @wishlist_item = WishlistItem.find(params[:id])
  end

  def permitted_params
    params.require(:wishlist_item).permit(:instrument, :quantity, :date_required, :importance)
  end
end
