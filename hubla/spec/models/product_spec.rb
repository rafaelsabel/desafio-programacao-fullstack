require 'rails_helper'

describe Product do
  describe "associations" do
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:users_products) }
    it { is_expected.to have_many(:main_affiliates) }
    it { is_expected.to have_many(:affiliates) }
    it { is_expected.to have_one(:main_producer) }
    it { is_expected.to have_one(:producer) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0).is_less_than(10**15) }
    it { is_expected.to validate_presence_of(:producer_id).on(:create) }
  end
end
