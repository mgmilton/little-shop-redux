describe "As a user" do
  context "when I visit new categories page" do
    it "I can see a name field in which to enter a category" do
      visit '/categories/new'
        fill_in "category[name]", with: "Food"

        click_on 'Submit'


        expect(current_path).to eq("/categories")
        expect(Category.count).to eq(1)
      end
    end
end
