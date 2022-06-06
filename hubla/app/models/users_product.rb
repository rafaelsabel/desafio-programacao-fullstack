class UsersProduct < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user
  belongs_to :product

  enum type: { producer: 1, affiliate: 2 }, _prefix: true

  validate :allow_user?

  private

  def allow_user?
    return if user.blank? || type_producer?

    errors.add(:user, 'cannot be affiliated with the product itself') if user.my_products.where(id: product_id).exists?
  end
end
