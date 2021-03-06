describe "As a user" do
  context "when I visit category by id path" do
    it "I see a link to category index" do

      Category.create(name: "Writing Utensils", id: 44)

      visit 'categories/44'

      expect(page).to have_text("Writing")
      expect(page.status_code).to eq(200)
    end

    it "When I click on category index link I go to categories page" do
      Category.create(name: "Writing Utensils", id: 44)

      visit 'categories/44'

      click_link 'Categories'

      expect(current_path).to eq('/categories')
      expect(page.status_code).to eq(200)
    end
  end
end
