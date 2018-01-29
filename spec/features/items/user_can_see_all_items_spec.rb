describe "As a user" do
  context "when I visit the items path" do
    it "I can see All Items header" do
      visit('/items')

      expect(page).to have_content('All Items')
      expect(page.status_code).to eq(200)
    end

    it "has a create item link" do
      visit('/items')

      expect(page).to have_content('Create an item')
      expect(page.status_code).to eq(200)
    end

    it "has a link of items id" do
      Item.create(id: 1, name: "Thing 1", description: "is a thang", price: 500, image: 'data/images/default_item_img.jpg')

      visit('/items')

      expect(page).to have_link('1')
      expect(page.status_code).to eq(200)
    end

    it "has name of item" do
      Item.create(id: 1, name: "Thing 1", description: "is a thang", price: 500, image: 'data/images/default_item_img.jpg')

      visit('/items')

      expect(page).to have_content('Thing 1')
      expect(page.status_code).to eq(200)
    end

    it "has link to edit item" do
      Item.create(id: 1, name: "Thing 1", description: "is a thang", price: 500, image: 'data/images/default_item_img.jpg')

      visit('/items')

      expect(page).to have_link('Edit')
      expect(page.status_code).to eq(200)
    end

    it "when I click on the edit link it takes me to the items/:id/edit path" do
      Item.create(id: 1, name: "Thing 1", description: "is a thang", price: 500, image: 'data/images/default_item_img.jpg')

      visit('/items')

      click_on('Edit')

      expect(current_path).to eq('/items/1/edit')
      expect(page.status_code).to eq(200)
    end

    it "when I click on the delete link the merchant is gone" do
      Item.create(id: 1, name: "Thing 1", description: "is a thang", price: 500, image: 'data/images/default_item_img.jpg')

      visit('/items')

      click_on('delete')

      expect(Item.count).to eq(0)
      expect(page.status_code).to eq(200)
    end
  end
end
