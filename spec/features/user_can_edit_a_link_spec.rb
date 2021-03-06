require "rails_helper"

RSpec.feature "User can edit a link" do
  context "With a valid url and title" do
    scenario "The link is created and they see it on the index" do
      user = create(:user)
      link = create(:link, user_id: user.id)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit root_path
      click_link("Edit Link")

      within (".edit-link-form") do
        fill_in link.name, with: "Updated Link"
        fill_in link.url, with: "http://www.updatedlink.com"
        click_button "Update Link"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Updated Link")
      expect(page).to have_content("http://www.updatedlink.com")
    end
  end

  context "With invalid url" do
    scenario "The link is not created and they see an error message" do
      user = create(:user)
      link = create(:link, user_id: user.id)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit root_path
      click_link("Edit Link")

      within (".edit-link-form") do
        fill_in link.name, with: "My Link"
        fill_in link.url, with: "mylink!"
        click_button "Update Link"
      end

      expect(current_path).to eq(edit_link_path(link))
      expect(page).to have_content("Url is not a valid URL")
      expect(page).not_to have_content("My Link")
      expect(page).not_to have_content("http://www.mylink.com")
    end
  end
end
