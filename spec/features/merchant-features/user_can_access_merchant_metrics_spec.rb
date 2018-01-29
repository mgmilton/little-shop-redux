describe "When user visits merchants-dashboard path" do
  context "they can see" do
    it "the merchant dashboard header" do
      Item.create(id: 1, name: "Item 1", merchant_id: 1, price: 500)
      Item.create(id: 2, name: "Item 2", merchant_id: 1, price: 500)
      Item.create(id: 3, name: "Item 3", merchant_id: 1, price: 200)
      Item.create(id: 4, name: "Item 4", merchant_id: 2, price: 100)
      Merchant.create(id: 1, name: "Merch_1")
      Merchant.create(id: 2, name: "Merch_2")
      visit '/merchants-dashboard'

      expect(page).to have_content('Merchant Metrics')
    end

    it "" do
    end
  end
  it "they see merchant with most items" do
    Item.create(id: 1, name: "Item 1", merchant_id: 1, price: 500)
    Item.create(id: 2, name: "Item 2", merchant_id: 1, price: 500)
    Item.create(id: 3, name: "Item 3", merchant_id: 1, price: 200)
    Item.create(id: 4, name: "Item 4", merchant_id: 2, price: 100)
    Merchant.create(id: 1, name: "Merch_1")
    Merchant.create(id: 2, name: "Merch_2")

    visit '/merchants-dashboard'
    require "pry"; binding.pry

    expect(page).to have_content('Merch_1')
  end
end
