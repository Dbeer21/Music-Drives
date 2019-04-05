class CreateWishlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_items do |t|
      t.string :instrument
      t.integer :quantity
      t.string :date_required
      t.string :importance

      t.timestamps
    end
  end
end
