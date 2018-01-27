describe Item do
  describe "Validations" do
    context 'Item validations' do
      it "item entry is valid with name" do
        item = Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(item).to be_valid
      end

      it "item entry is valid with description" do
        item = Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(item).to be_valid
      end

      it "item entry is valid with price" do
        item = Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(item).to be_valid
      end

      it "item entry is valid with image" do
        item = Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        visit('/items/1')

        expect(item).to be_valid
        expect(page).to have_content('data/images/default_item_img.jpg')
      end

      it "item entry cannot be valid without a name" do
        item = Item.create(id: 1, description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(item).to_not be_valid
      end

      it "item entry cannot be valid without a description" do
        item = Item.create(id: 1, name: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(item).to_not be_valid
      end

      it "item entry cannot be valid without a price" do
        item = Item.create(id: 1, name: "Thing" ,description: "a real cool thing", image: "data/images/default_item_img.jpg")

        expect(item).to_not be_valid
      end

      it "item entry cannot be valid without an image" do
        item = Item.create(id: 1, name: "Thing" ,description: "a real cool thing")

        expect(item).to_not be_valid
      end
    end
  end
end
