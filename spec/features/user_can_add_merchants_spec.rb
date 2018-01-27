describe "As a user" do
  context "when I visit new merchants path" do
    it "I can see 3 fields in which to enter merchant data" do
      visit '/merchants/new'

      fill_in "merchant[name]", with: "Buisness Name"
      click_on 'Submit'

      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(1)
    end
  end
end
