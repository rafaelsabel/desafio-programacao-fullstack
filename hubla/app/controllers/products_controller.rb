class ProductsController < ApplicationController
  before_action :set_product, only: %i[ edit update destroy ]

  def sales
    @product = Product.find(params[:id])

    @affiliates = @product.affiliates.select("users.name, (SELECT SUM(amount) FROM transactions WHERE product_id = #{@product.id} AND user_id = users.id AND type = 2) sales_amount, (SELECT SUM(amount) FROM transactions WHERE product_id = #{@product.id} AND user_id = users.id AND type = 3) commission_amount")

    if current_user.role_admin?
      @producer = @product.producer
      @sales_amount = @producer.transactions.where(product_id: @product.id, type: :producer_sale).sum(:amount)
      @commission_amount = @producer.transactions.where(product_id: @product.id, type: :commission_received).sum(:amount)
    else
      @sales_amount = current_user.transactions.where(product_id: @product.id, type: :producer_sale).sum(:amount)
      @commission_amount = current_user.transactions.where(product_id: @product.id, type: :commission_received).sum(:amount)
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params.merge(producer_id: current_user.id))

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_url, notice: "Produto criado com sucesso." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to root_url, notice: "Produto editado com sucesso." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Produto excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
