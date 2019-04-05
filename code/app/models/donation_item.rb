class DonationItem < ApplicationRecord

  validates_presence_of :instrument, :condition, :quantity, :location, :name, :email

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
