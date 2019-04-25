# Project Name: Music Drives
# Description: Users can donate instruments for Trenton schools to acquire
# Filename: donation_items_controller.rb
# Description: This file allows users to create, edit, delete, and request donations
# Last modified on: 4/24/2019

class Internal::DonationItemsController < ApplicationController
  before_action :initialize_donation_item, only: %i[edit show]

  #------------------------------------------------------------------
  #
  # Function: index()
  #
  # Post-condition: display all donation listings on the home page
  #
  # -----------------------------------------------------------------
  def index
    @donation_items = DonationItem.all
  end

  #------------------------------------------------------------------
  #
  # Function: new()
  #
  # Post-condition: generate a new donation item
  #
  # -----------------------------------------------------------------
  def new
    @donation_item = DonationItem.new
  end

  #------------------------------------------------------------------
  #
  # Function: create()
  #
  # Parameters:
  # input string; instrument name
  # input string; instrument condition
  # input integer; quantity of instrument
  # input string; location of donor
  # input string; name of donor
  # input string; email of donor
  #
  # Pre-condition: donation item must have every parameter filled
  #
  # Post-condition: create and display the new donation item along
  # with the others on the index page
  #
  # -----------------------------------------------------------------
  def create
    @donation_item = DonationItem.new(permitted_params)

    if @donation_item.save
      redirect_to internal_donation_items_path, notice: 'The donation was successfully listed.'
    else
      render :new
    end
  end

  #------------------------------------------------------------------
  #
  # Function: update()
  #
  # Parameters:
  # input integer; donation id
  # input string; instrument name
  # input string; instrument condition
  # input integer; quantity of instrument
  # input string; location of donor
  # input string; name of donor
  # input string; email of donor
  #
  # Pre-condition: donation item must exist
  #
  # Post-condition: display the updated donation item along with the
  # others on the index page
  #
  # -----------------------------------------------------------------
  def update
    @donation_item = DonationItem.find(params[:id])

    if @donation_item.update(permitted_params)
      redirect_to internal_donation_items_path, notice: 'The donation was successfully updated.'
    else
      render :new
    end
  end

  #------------------------------------------------------------------
  #
  # Function: destroy()
  #
  # Parameters:
  # input integer: donation id
  #
  # Pre-condition: donation item must exist
  #
  # Post-condition: remove the donation item from the database and
  # display the updated table of donations
  #
  #------------------------------------------------------------------
  def destroy
    @donation_item = DonationItem.find(params[:id])
    @donation_item.destroy
    redirect_to internal_donation_items_path, notice: 'The donation was successfully deleted.'
  end

  #------------------------------------------------------------------
  #
  # Function: initialize_donation_itemm()
  #
  # Parameters:
  # input integer; donation id
  #
  # Pre-condition: donation item must have a valid id
  #
  # Post-condition: the initialized donation item will be used for
  # other purposes, such as editing
  #
  #------------------------------------------------------------------
  def initialize_donation_item
    @donation_item = DonationItem.find(params[:id])
  end

  #------------------------------------------------------------------
  #
  # Function: permitted_params()
  #
  # Parameters:
  # input DonationItem; donation item
  #
  # Post-condition: the following variables are required when
  # validating a donation item: instrument, condition, quantity,
  # location, name, and email
  #
  #------------------------------------------------------------------
  def permitted_params
    params.require(:donation_item).permit(:instrument, :condition, :quantity, :location, :name, :email)
  end
end
