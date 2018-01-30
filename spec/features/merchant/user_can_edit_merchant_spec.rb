describe "When a user is at path /merchants" do
  context "and clicks on the edit button for a merchant" do
    it "they arrive at /merchants/:id/edit" do
      Merchant.create!(name: "Merles Haggards")
      Merchant.create!(name: "Jean's Jeans")

      visit '/merchants'

      within('div.merchant2') {click_link('Edit')}

      expect(current_path).to eq('/merchants/2/edit')
    end
  end

  context "and clicks on the delete button for a merchant" do
    it "it removes a merchant" do
      Merchant.create!(name: "Mo Merchants Mo Problems")
      Merchant.create!(name: "2 many merchs")

      visit '/merchants'

      within('div.merchant1') {click_button('delete')}

      expect(Merchant.count).to eq(1)
      expect(page).to have_content("2 many merchs")
    end
  end
end

describe "When a user has arrived at path /merchants/1/edit" do
  context "and they see the merchant to edit" do
    it "they can click Submit" do
      Merchant.create!(name: "Nellyville")

      visit '/merchants'

      click_link('Edit')

      expect(page).to have_content('Edit')
    end
  end
end
