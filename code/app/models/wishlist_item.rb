class WishlistItem < ApplicationRecord
  require 'time'

  # require the presence of the following variables
  validates_presence_of :instrument, :quantity, :date_required, :importance

  # format the received input
  before_validation do
    self.instrument = instrument.strip
    self.quantity = quantity
    date_obj = Date.strptime(date_required.strip, '%Y-%m-%d')
    self.date_required = date_obj.mon.to_s + '/' + date_obj.day.to_s + '/' + date_obj.year.to_s 
    self.importance = importance.strip
  end

  default_scope { order(instrument: :asc).order(created_at: :desc) }
end
