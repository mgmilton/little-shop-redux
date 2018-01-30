describe "Merchants/New" do
  context "As a user, when I visit new merchants path" do
    it "I see the information needed to enter merchant data" do
      visit '/merchants/new'

      expect(page).to have_button('submit')
    end
    it "I can give input to the fields that allow me to enter merchant data" do
      visit '/merchants/new'
      fill_in "merchant[name]", with: "Buisness Name"

      click_on('submit')

      expect(current_path).to eq('/merchants')
    end
  end
end

# find_link('Hello').visible?


# expect(Merchant.count).to eq(1)
# expect(page).to have_content('1')
# expect(page).to have_content('Buisness Name')
