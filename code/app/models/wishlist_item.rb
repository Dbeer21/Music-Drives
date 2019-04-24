class WishlistItem < ApplicationRecord
  require 'time'

  validates_presence_of :instrument, :quantity, :date_required, :importance

  before_validation do
    self.instrument = instrument.strip
    self.quantity = quantity
    date_obj = Time.strptime(date_required.strip, '%Y-%m-%d')
    self.date_required = date_obj.mon.to_s + '/' + date_obj.day.to_s + '/' + date_obj.year.to_s 
    self.importance = importance.strip
  end

  default_scope { order(instrument: :asc).order(created_at: :desc) }
end
