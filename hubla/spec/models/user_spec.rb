require 'rails_helper'

describe User do
  describe "associations" do
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:users_products) }
    it { is_expected.to have_many(:main_sale_products) }
    it { is_expected.to have_many(:sale_products) }
    it { is_expected.to have_many(:main_products) }
    it { is_expected.to have_many(:my_products) }
    it { is_expected.to have_many_attached(:files) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_presence_of(:role) }
  end
end
