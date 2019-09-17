class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :item_quantity
      t.belongs_to :item
      t.belongs_to :purchaser
      t.belongs_to :merchant
      t.timestamps
    end
  end
end
