class Internal::DonationItemsController < ApplicationController
  before_action :initialize_donation_item, only: %i[edit show]

  def show
  end

  def index
    @donation_items = DonationItem.all
  end

  def new
    @donation_item = DonationItem.new
  end

  def create
    @donation_item = DonationItem.new(permitted_params)

    if @donation_item.save
      redirect_to internal_donation_items_path(), notice: 'The donation was successfully listed.'
    else
      render :new
    end
  end

  def edit
  end

  def permitted_params
    params.require(:donation_item).permit(:instrument, :condition, :quantity, :location, :name, :email)
  end
end
