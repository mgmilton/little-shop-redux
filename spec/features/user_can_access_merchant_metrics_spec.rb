describe "When user visits merchants-dashboard path" do
  context "they can see" do
    it "the merchants dashboard header" do
      visit '/merchants-dashboard'

      expect(page).to have_content('Merchant Metrics')
    end

    it "" do
    end
  end
  it "they see merchant with most items" do
    i1 = Item.create(id: 1, name: "Item 1", merchant_id: 1)
    i2 = Item.create(id: 2, name: "Item 2", merchant_id: 1)
    i3 = Item.create(id: 3, name: "Item 3", merchant_id: 1)
    i4 = Item.create(id: 4, name: "Item 4", merchant_id: 2)
    m1 = Merchant.create(id: 1, name: "Merch_1")
    m2 = Merchant.create(id: 2, name: "Merch_2")

    visit '/merchants-dashboard'
    # save_and_open_page
    expect(page).to have_content('Merch_1')
  end
end
