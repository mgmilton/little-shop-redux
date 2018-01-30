describe "As a user" do
  context "I see the Create An Item link and click on the link" do
    it "and then I arrive at /items/new" do
      Item.create(name: "A whole new item")
      visit '/items'

      click_link 'Create an item'
      expect(current_path).to eq('/items/new')
      expect(page.status_code).to eq(200)
    end
  end
end
