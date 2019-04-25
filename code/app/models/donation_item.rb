# Project Name: Music Drives
# Description: Users can donate instruments for Trenton schools to acquire
# Filename: donation_item.rb
# Description: This file contains the variables and requirements for donation items
# Last modified on: 4/24/2019

class DonationItem < ApplicationRecord

  # require the presence of the following variables
  validates_presence_of :instrument, :condition, :quantity, :location, :name, :email

  # format the received input
  before_validation do
    self.instrument = instrument.strip
    self.condition = condition.strip
    self.quantity = quantity
    self.location = location.strip
    self.name = name.strip
    self.email = email.strip
  end

  default_scope { order(instrument: :asc).order(created_at: :desc) }
end
