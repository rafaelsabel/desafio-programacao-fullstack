class HomeController < ApplicationController
  def index
    if current_user.role_admin?
      @products = Product.all.includes(:producer).paginate(page: params[:page], per_page: 15)
    else
      @products = current_user.my_products.paginate(page: params[:page], per_page: 15)
      @transactions = current_user.transactions.includes(:product).order(date: :asc)

      @sales_amount = @transactions.where(type: [:producer_sale, :affiliate_sale]).sum(:amount)
      @commission_amount = @transactions.where(type: [:commission_paid, :commission_received]).sum(:amount)

      @transactions = @transactions.paginate(page: params[:page], per_page: 15)
    end
  end
end
