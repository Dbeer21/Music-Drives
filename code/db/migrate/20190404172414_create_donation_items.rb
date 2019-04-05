class CreateDonationItems < ActiveRecord::Migration[5.2]
  def down
    drop_table :donation_items
  end

  def change
    create_table :donation_items do |t|
      t.string :instrument
      t.string :condition
      t.integer :quantity
      t.string :location
      t.string :name
      t.string :email

      t.timestamps
    end
  end  
end
