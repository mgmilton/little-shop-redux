RSpec.describe Merchant do

  describe "Validations" do
    context
    it "merchant entry is invalid without a name" do
      merchant = Merchant.create(id:1)
      expect(merchant).to_not be_valid
    end
  end
end
