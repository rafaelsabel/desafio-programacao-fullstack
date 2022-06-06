class Transaction < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user
  belongs_to :product

  enum type: { producer_sale: 1, affiliate_sale: 2, commission_paid: 3, commission_received: 4 }, _prefix: true

  validates :amount, numericality: { greater_than: 0, less_than: 10**15 }, allow_blank: false
  validates :date, :type, presence: true
end
