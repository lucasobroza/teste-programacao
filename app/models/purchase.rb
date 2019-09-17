class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant
  belongs_to :purchase_batch

  def total_value
    item_quantity * item.price
  end

  def self.create_from_file(purchases_params)
    purchases = []
    purchases_params.each do |purchase_params|
      purchase = Purchase.new;
      purchase.item_quantity = purchase_params["purchase count"]
      purchase.purchaser = Purchaser.find_or_initialize_by({name: purchase_params["purchaser name"]})
      purchase.item = Item.find_or_initialize_by({description: purchase_params["item description"], price: purchase_params["item price"]})
      purchase.merchant = Merchant.find_or_initialize_by({name: purchase_params["merchant name"], address: purchase_params["merchant address"]})
      purchases.push(purchase)
    end
    return purchases
  end

end
