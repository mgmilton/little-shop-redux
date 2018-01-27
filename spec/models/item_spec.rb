describe Item do
  describe "Class Methods" do
    describe ".total" do
      it "returns count of items" do

        Item.create(id: 1, name: "An item", description: "a real cool thing", price: 5, image: "data/images/default_item_img.jpg")

        Item.create(id: 3, name: "A new item", description: "a thing", price: 5, image: "data/images/default_item_img.jpg")

        expect(Item.total).to eq(2)
      end
    end

    describe ".average" do
      it "returns count of items" do

        Item.create(id: 1, name: "An item", description: "a real cool thing", price: 10, image: "data/images/default_item_img.jpg")

        Item.create(id: 3, name: "A new item", description: "a thing", price: 15, image: "data/images/default_item_img.jpg")

        expect(Item.average_price_per_item).to eq(6.25)
      end
    end
  end


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
