class WishlistItem < ApplicationRecord

  validates_presence_of :instrument, :quantity, :date_required, :importance

  before_validation do
    self.instrument = instrument.strip
    self.quantity = quantity
    self.date_required = date_required.strip
    self.importance = importance.strip
  end

  default_scope { order(instrument: :asc).order(created_at: :desc) }
end
