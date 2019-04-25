# Project Name: Music Drives
# Description: Users can donate instruments for Trenton schools to acquire
# Filename: wishlist_items_controller.rb
# Description: This file allows admins to create, edit, and delete items on the wishlist
# Last modified on: 4/24/2019

class Internal::WishlistItemsController < ApplicationController
  before_action :initialize_wishlist_item, only: %i[edit show]

  #------------------------------------------------------------------
  #
  # Function: index()
  #
  # Post-condition: display all wishlist item on wishlist page
  #
  # ----------------------------------------------------------------- 
  def index
    @wishlist_items = WishlistItem.all
  end

   #------------------------------------------------------------------
   #
   # Function: new()
   #
   # Post-condition: generate a new wishlist item
   #
   # -----------------------------------------------------------------
  def new
    @wishlist_item = WishlistItem.new
  end

  #-------------------------------------------------------------------
  #
  # Function: create()
  #
  # Parameters:
  # input string; instrument name
  # input integer; quantity of instrument
  # input string; date required by
  # input string; level of importance
  #
  # Pre-conditions: all variables must be validated
  #
  # Post-condition: create a new wishlist item and display it on the
  # wishlist page 
  #
  #-------------------------------------------------------------------
  def create
    @wishlist_item = WishlistItem.new(permitted_params)

    if @wishlist_item.save
      redirect_to internal_wishlist_items_path, notice: 'The instrument was successfully added to the wishlist.'
    else
      render :new
    end
  end

  #-------------------------------------------------------------------
  #
  # Function: update()
  #
  # Parameters:
  # input integer; wishlist id
  # input string; instrument name
  # input integer; quantity of instrument
  # input string; date required by
  # input string; level of importance
  #
  # Pre-condition: wishlist item must exist
  #
  # Post-condition: display the edited wishlist item on the wishlist
  # page
  #
  #-------------------------------------------------------------------
  def update
    @wishlist_item = WishlistItem.find(params[:id])

    if @wishlist_item.update(permitted_params)
      redirect_to internal_wishlist_items_path, notice: 'The wishlist instrument was successfully updated.'
    else
      render :new
    end
  end

  #-------------------------------------------------------------------
  # 
  # Function: destroy()
  #
  # Parameters:
  # input integer; wishlist id
  #
  # Pre-condition: wishlist item must exist
  #
  # Post-condition: remove the instrument from the wishlist and
  # display the updated wishlist 
  #
  #-------------------------------------------------------------------
  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    redirect_to internal_wishlist_items_path, notice: 'The instrument was successfully removed from the wishlist.'
  end

  #------------------------------------------------------------------
  #
  # Function: initialize_wsishlist_itemm()
  #
  # Parameters:
  # input integer; wishlist id
  #
  # Pre-condition: wishlist item must have a valid id
  #
  # Post-condition: the initialized wishlist item will be used for
  # other purposes, such as editing
  #
  #------------------------------------------------------------------
  def initialize_wishlist_item
    @wishlist_item = WishlistItem.find(params[:id])
  end

  #------------------------------------------------------------------
  #
  # Function: permitted_params()
  #
  # Parameters:
  # input WishlistItem; wishlist item
  #
  # Post-condition: the following variables are required when
  # validating a wishlist item: instrument, quantity, date required,
  # and importance
  #
  #------------------------------------------------------------------
  def permitted_params
    params.require(:wishlist_item).permit(:instrument, :quantity, :date_required, :importance)
  end
end
