class Product < ApplicationRecord
  attr_accessor :producer_id

  has_many :transactions, dependent: :destroy
  has_many :users_products, dependent: :destroy

  has_many :main_affiliates, -> { where(type: :affiliate) }, class_name: 'UsersProduct'
  has_many :affiliates, through: :main_affiliates, source: :user, class_name: 'User'

  has_one :main_producer, -> { where(type: :producer) }, class_name: 'UsersProduct'
  has_one :producer, through: :main_producer, source: :user, class_name: 'User'

  after_create :associate_producer

  validates :name, length: { maximum: 255 }, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 10**15 }, allow_blank: false
  validates :producer_id, presence: true, on: :create

  private

  def associate_producer
    create_main_producer!(user_id: producer_id, type: :producer)
  end
end
