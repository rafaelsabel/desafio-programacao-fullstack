require 'rails_helper'

describe Transaction do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end

  describe "validations" do
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0).is_less_than(10**15) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
