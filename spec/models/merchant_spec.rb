describe Merchant do
  describe "Validations" do
    context 'Data validations' do
      it "merchant entry is invalid without a name" do
        merchant = Merchant.create(name: nil, id: 1)

        expect(merchant).to_not be_valid
      end

      it 'merchant entry is invalid if name is not unique' do
        merchant = Merchant.create!(name: "Deadbeat", id: 1)
        merchant_2 = Merchant.create(name: "Deadbeat", id: 2)

        expect(merchant).to be_valid
        expect(merchant_2).to_not be_valid
      end

      it 'merchant entry is valid with name' do
        merchant = Merchant.create!(name: "Bad dude", id: 1)

        expect(merchant).to be_valid
      end
    end

    describe "Instance method" do
      it 'merchant has total price information for all items it has' do
        item1 = Item.create!(id: 1, name: "a thing", description: "does stuff", price: 200, image: 'thing', merchant_id: 1)
        item2 = Item.create!(id: 2, name: "the thing", description: "does more stuff", price: 250, image: 'thing', merchant_id: 1)
        item3 = Item.create!(id: 3, name: "a whole new thing", description: "does all the stuff", price: 550, image: 'thing', merchant_id: 2)
        merchant = Merchant.create!(name: "Good dude", id: 1)
        merchant2 = Merchant.create!(name: "The dude", id: 2)

        expect(merchant.item_total_sum).to eq(450)
      end
    end

    describe "Class method" do
      it 'merchant with most items is returned correctly' do
        item1 = Item.create!(id: 1, name: "a thing", description: "does stuff", price: 200, image: 'thing', merchant_id: 1)
        item2 = Item.create!(id: 2, name: "the thing", description: "does more stuff", price: 250, image: 'thing', merchant_id: 1)
        item3 = Item.create!(id: 3, name: "a whole new thing", description: "does all the stuff", price: 550, image: 'thing', merchant_id: 2)
        merchant = Merchant.create!(name: "Good dude", id: 1)
        merchant2 = Merchant.create!(name: "The dude", id: 2)

        expect(Merchant.most_item_merchants).to eq([merchant])
      end
    end
  end
end
