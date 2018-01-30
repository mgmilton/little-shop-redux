describe "When user visits merchants-dashboard path" do
  context "they can see" do
    it "the merchant dashboard header" do
      Item.create!(id: 1, name: "Item 1", description: "a thing", merchant_id: 1, price: 500, image: 'image')
      Item.create!(id: 2, name: "Item 2", description: "another thing", merchant_id: 1, price: 500, image: 'image')
      Item.create!(id: 3, name: "Item 3", description: "stuff", merchant_id: 1, price: 200, image: 'image')
      Item.create!(id: 4, name: "Item 4", description: "more stuff", merchant_id: 2, price: 100, image: 'image')
      Merchant.create!(id: 1, name: "Merch_1")
      Merchant.create!(id: 2, name: "Merch_2")

      visit '/merchants-dashboard'

      expect(page).to have_content('Merchant Metrics')
    end

    it "the golden merchant data" do
      Item.create!(id: 1, name: "Item 1", description: "a thing", merchant_id: 1, price: 500, image: 'image')
      Item.create!(id: 2, name: "Item 2", description: "another thing", merchant_id: 1, price: 500, image: 'image')
      Item.create!(id: 3, name: "Item 3", description: "stuff", merchant_id: 1, price: 200, image: 'image')
      Item.create!(id: 4, name: "Item 4", description: "more stuff", merchant_id: 2, price: 100, image: 'image')
      Merchant.create!(id: 1, name: "Merch_1")
      Merchant.create!(id: 2, name: "Merch_2")

      visit '/merchants-dashboard'

      expect(page).to have_content('Golden Merchant')
    end
  end
  it "they see merchant with most items" do
    Item.create!(id: 1, name: "Item 1", description: "a thing", merchant_id: 1, price: 500, image: 'image')
    Item.create!(id: 2, name: "Item 2", description: "another thing", merchant_id: 1, price: 500, image: 'image')
    Item.create!(id: 3, name: "Item 3", description: "stuff", merchant_id: 1, price: 200, image: 'image')
    Item.create!(id: 4, name: "Item 4", description: "more stuff", merchant_id: 2, price: 100, image: 'image')
    Merchant.create!(id: 1, name: "Merch_1")
    Merchant.create!(id: 2, name: "Merch_2")

    visit '/merchants-dashboard'

    expect(page).to have_content('Merch_1')
  end
end
