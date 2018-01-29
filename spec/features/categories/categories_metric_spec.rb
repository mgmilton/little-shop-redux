describe "As a user" do
  context "when I visit categories-dashboard" do
    it "I can see the metrics" do
      Category.create(name: "Food", id: 1)
      Category.create(name: "Recreation", id: 2)
      Category.create(name: "Sports", id: 3)
      Category.create(name: "Pets", id: 4)
      Category.create(name: "RealEstate", id: 5)
      Item.create(name: "A", description: "B", price: 10, image: "s", category_id: 1)
      Item.create(name: "Apple", description: "Bad", price: 2, image: "s", category_id: 1)
      Item.create(name: "B", description: "C", price: 1, image: "s", category_id: 2)
      Item.create(name: "Bugsy", description: "Callow", price: 12, image: "s", category_id: 2)
      Item.create(name: "C", description: "D", price: 1, image: "s", category_id: 3)
      Item.create(name: "Cauliflower", description: "Dinner", price: 3, image: "s", category_id: 3)
      Item.create(name: "E", description: "F", price: 0.1, image: "s", category_id: 4)
      Item.create(name: "Eggplant", description: "Flower", price: 1, image: "s", category_id: 4)
      Item.create(name: "G", description: "H", price: 1, image: "s", category_id: 5)
      Item.create(name: "Ghostly", description: "Herodotus", price: 3, image: "s", category_id: 5)

      visit '/categories-dashboard'

      expect(current_path).to eq('/categories-dashboard')
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Average Item price for Food: $0.06")
      expect(page).to have_content("Average Item price for Recreation: $ 0.07")
      expect(page).to have_content("Average Item price for Sports: $ 0.02")
      expect(page).to have_content("Average Item price for Pets: $ 0.01")
      expect(page).to have_content("Average Item price for RealEstate: $ 0.02")
      expect(page).to have_content("Category with Most Expensive Item: Recreation")
      expect(page).to have_content("Category with Least Expensive Item: Pets")
    end
  end
end
