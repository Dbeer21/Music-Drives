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
