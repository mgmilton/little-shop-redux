describe "As a user" do
  context 'when I visit merchants path' do
    it "I can see and click new merchant link and go to the new merchant page from link" do
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
      expect(page).to have_content("Zac")
      expect(Merchant.count).to eq(6)
    end

    it "I can click merchants id link and go to specific merchant page" do
      Merchant.create(name: "bobbyboes", id: 777)

      visit '/merchants'

      click_on '777'

      expect(current_path).to eq('/merchants/777')
    end

    it "I can see and click the edit link to edit the merchant under merchant information" do
      Merchant.create(name: "Spangles", id: 316)

      visit '/merchants'

      click_on 'Edit'

      expect(current_path).to eq('/merchants/316/edit')
    end

    it "I can see and click the delete button to delete a specific merchant and only see remaining merchants" do
      Merchant.create(name: "thing", id: 1)

      visit '/merchants'

      click_on 'delete'

      expect(Merchant.count).to eq(0)
    end
  end
end
