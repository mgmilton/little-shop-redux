describe "As a user" do
  context 'when I visit merchants path' do
    it "I can create a new merchant" do
      visit '/merchants'

      click_on 'Create a merchant'

      expect(current_path).to eq('/merchants/new')
  end

    it "I can see all merchants displayed" do
      Merchant.create(name: "Holly")
      Merchant.create(name: "Bobby")
      Merchant.create(name: "Billie")
      Merchant.create(name: "Matthew")
      Merchant.create(name: "Luis")
      Merchant.create(name: "Zac")
        visit '/merchants'

      expect(current_path).to eq("/merchants")
      expect(page).to have_content("All Merchants")
      expect(page).to have_content("Holly")
      expect(Merchant.count).to eq(6)
    end
  end
  # context "something else" do
end
