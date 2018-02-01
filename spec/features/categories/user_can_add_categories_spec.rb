describe "As a user" do
  # context "when I visit the root categories page" do
  #   it "I can create a new category" do
  #     click_button("Create A Category")
  #   end
  # end

  context "when I visit new categories page" do
    it "I can see a name field in which to enter a category" do
      visit '/categories/new'
        fill_in "category[name]", with: "Food"

        click_on 'Submit'

        save_and_open_page
        expect(current_path).to eq("/categories")
        expect(page.status_code).to eq(200)
        expect(Category.count).to eq(1)
      end
    end
end
