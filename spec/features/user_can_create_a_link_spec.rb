require "rails_helper"

RSpec.feature "User can create a link" do
  context "With a valid url and title" do
    scenario "The link is created and they see it on the index" do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit root_path

      within (".new-link-form") do
        fill_in "Name", with: "My Link"
        fill_in "URL", with: "http://www.mylink.com"
        click_button "Create Link"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("My Link")
      expect(page).to have_content("http://www.mylink.com")
    end
  end

  context "With invalid url" do
    scenario "The link is not created and they see an error message" do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit root_path

      within (".new-link-form") do
        fill_in "Name", with: "My Link"
        fill_in "URL", with: "mylink!"
        click_button "Create Link"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Url is not a valid URL")
      expect(page).not_to have_content("My Link")
      expect(page).not_to have_content("http://www.mylink.com")
    end
  end

  context "With missing title" do
    scenario "The link is not created and they see an error message" do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit root_path

      within (".new-link-form") do
        fill_in "URL", with: "http://www.mylink.com"
        click_button "Create Link"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Name can't be blank")
      expect(page).not_to have_content("My Link")
      expect(page).not_to have_content("http://www.mylink.com")
    end
  end
end
