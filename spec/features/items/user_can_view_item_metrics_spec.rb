describe "As a user" do
  context "when I visit items-dashboard" do
    it "I can see the metrics" do

      Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

      Item.create(id: 3, name: "A new item", description: "a thing", price: 5, image: "data/images/default_item_img.jpg")

      visit '/items-dashboard'

      expect(current_path).to eq('/items-dashboard')
      expect(page).to have_content(2)
      expect(page).to have_content(0.05)
      expect(page).to have_content("An item")
      expect(page).to have_content("A new item")
      expect(page.status_code).to eq(200)
    end
  end
end
