describe "As a user" do
  context "When I click on the edit link" do
    it "I am redirectored to a category edit page" do
      Category.create(name: "Posi-vibes")

      visit '/categories'
      click_link('Edit')

      expect(current_path).to eq('/categories/1/edit')
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Edit")
    end
  end
end
