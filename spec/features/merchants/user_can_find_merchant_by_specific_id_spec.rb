describe "As a user" do
  context "when I visit merchant by id path" do
    it "I see a link to merchant index" do

      Merchant.create(name: "Georginas Nails", id: 2)

      visit 'merchants/2'

      expect(page).to have_link('Merchant Index')
      expect(page).to have_text("Georginas Nails")
      expect(page).to have_text("2")
    end

    it "When I click on merchant index link I go to merchants page" do
      Merchant.create(name: "Georginas Nails", id: 2)

      visit 'merchants/2'

      click_link 'merchant_index'

      expect(current_path).to eq('/merchants')
    end
  end
end
