describe "As a user" do
  context "when I visit categories path" do
    it "I can see and click new category button and go to new category page from button" do
      visit '/categories'

      save_and_open_page
      click_button("Create A Category")
      expect(current_path).to eq('/categories/new')
    end

    it "I can see all categories displayed" do
      Category.create(name: "Food")
      Category.create(name: "Recreation")
      Category.create(name: "Sports")

      visit '/categories'

      expect(current_path).to eq("/categories")
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Avalon's Altar Complete Categories List")
      expect(page).to have_content("Food")
      expect(Category.count).to eq(3)
    end

    it "I can click category id link and go to specific category page" do
      Category.create(name: "Food", id: 666)

      visit '/categories'

      click_on 'Food'

      expect(current_path).to eq('/categories/666')
      expect(page.status_code).to eq(200)
    end

    it "I can see and click the edit link to edit the category under category information" do
      Category.create(name: "Food", id: 3000)

      visit '/categories'

      click_on 'Edit'

      expect(current_path).to eq('/categories/3000/edit')
      expect(page.status_code).to eq(200)
    end
  end
end
