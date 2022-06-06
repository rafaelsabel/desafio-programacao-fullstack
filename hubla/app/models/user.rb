class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable, :validatable, :confirmable

  has_many :transactions
  has_many :users_products

  has_many :main_sale_products, -> { where(type: :affiliate) }, class_name: 'UsersProduct'
  has_many :sale_products, through: :main_sale_products, source: :product, class_name: 'Product'

  has_many :main_products, -> { where(type: :producer) }, class_name: 'UsersProduct'
  has_many :my_products, through: :main_products, source: :product, class_name: 'Product'

  has_many_attached :files

  enum role: { admin: 1, normal: 2 }, _prefix: true

  validates :name, length: { maximum: 255 }, presence: true
  validates :email, uniqueness: true, length: { maximum: 255 }
  validates :role, presence: true

  def affiliates
    my_products.map(&:affiliates).flatten.uniq
  end
end
