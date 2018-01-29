describe "As a user" do
  context "when I visit item by id path" do
    it "I can see a link to item index" do
      Item.create(name: "itemtime", description: "a thing", price: 5000, image: '/images/default_item_img.jpg', id: 44)

      visit 'items/44'

      expect(page).to have_text("itemtime")
      end

      it "When I click on item index link I go to categories page" do
        Item.create(name: "itemtime", description: "a thing", price: 5000, image: '/images/default_item_img.jpg', id: 44)

        visit 'items/44'

        click_link 'Items Index'

        expect(current_path).to eq('/items')
    end
  end
end
