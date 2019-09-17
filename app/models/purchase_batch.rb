class PurchaseBatch < ApplicationRecord
  has_many :purchases
  attr_accessor :batch_file
  paginates_per 10

  def parse_batch_file
    self.purchases = Purchase.create_from_file(parametrize_file)
    self.save
  end

  def total_value
    total_value = 0
    purchases.select {|purchase|total_value = total_value + purchase.total_value}
    total_value
  end

  private
    def parametrize_file
      purchases = batch_file.open.read.force_encoding('UTF-8').lines
      header = purchases.first.split("\t")
      purchases_params = []
      purchases.delete_at(0)
      purchases.each do |purchase|
        purchase_params = {}
        purchase.split("\t").each_with_index do |field, index|
          purchase_params["#{header[index]}"] = field
        end
        purchases_params.push(purchase_params)
      end
      purchases_params
    end
end
