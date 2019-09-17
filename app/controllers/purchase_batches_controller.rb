class PurchaseBatchesController < ApplicationController

  def new
    @purchase_batch = PurchaseBatch.new
  end

  def index
    @purchase_batches = PurchaseBatch.all.includes(:purchases, purchases:[:item]).page(params[:page])
  end

  def create
      @purchase_batch = PurchaseBatch.new(purchase_batch_params)
      @purchase_batch.parse_batch_file
      redirect_to purchase_batches_path
  end

  private
    def purchase_batch_params
      params.require(:purchase_batch).permit(:batch_file)
    end

end
