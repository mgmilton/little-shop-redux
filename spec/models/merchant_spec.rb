describe Merchant do

  describe "Validations" do
    context 'data validations'
    it "merchant entry is invalid without a name" do
      merchant = Merchant.create(id:1)
      expect(merchant).to_not be_valid
    end

    it 'merchant entry is invalid if name is not unique' do
      merchant = Merchant.create(name: "Deadbeat")
      merchant_2 = Merchant.create(name: "Deadbeat")
      expect(merchant).to be_valid
      expect(merchant_2).to_not be_valid
    end

    it 'merchant entry is valid with name' do
      merchant = Merchant.create(name: "Bad dude")
      expect(merchant).to be_valid
    end
  end
end
