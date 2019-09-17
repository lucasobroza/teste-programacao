class CreatePurchaseBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_batches do |t|
      t.decimal :total
      t.timestamps
    end
    add_reference :purchases, :purchase_batch, foreign_key: true
  end
end
