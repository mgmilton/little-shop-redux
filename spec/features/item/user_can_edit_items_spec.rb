describe "As a user" do
  context "when I click on the edit link" do
    it " I am redirected to items/:id/edit" do
      Item.create(name: "itemtime", description: "a thing", price: 5000, image: '/images/default_item_img.jpg')

      visit '/items'
      click_link('Edit')

      expect(current_path).to eq('/items/1/edit')
      page.has_content?('itemtime')
    end
  end
end
