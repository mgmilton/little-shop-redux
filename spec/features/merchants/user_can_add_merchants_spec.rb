describe "Merchants/New" do
  context "As a user, when I visit new merchants path" do
    it "I see the information needed to enter merchant data" do
      visit '/merchants/new'
      expect(page).to have_content('Enter a new merchant:')
      expect(page).to have_button('submit')
      expect(page).to have_field('Merchant Name', type: 'text')
    end
    it "I can give input to the fields that allow me to enter merchant data" do
      visit '/merchants/new'
      fill_in "merchant[name]", with: "Buisness Name"

      click_on('submit')

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('All Merchants')
      expect(page).to have_link('Buisness Name')
      expect(page).to have_link('Edit')
      expect(page).to have_button('delete')
    end
  end
end
