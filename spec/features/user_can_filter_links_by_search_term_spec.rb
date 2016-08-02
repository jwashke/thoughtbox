require "rails_helper"

RSpec.feature "User can mark a link as read or unread" do
  scenario "They can mark a link as read and the button changes to unread", js: true do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit root_path

    within (".new-link-form") do
      fill_in "Name", with: "My Link"
      fill_in "URL", with: "http://www.mylink.com"
      click_button "Create Link"
    end

    within (".new-link-form") do
      fill_in "Name", with: "unsearched link"
      fill_in "URL", with: "http://www.unsearchedlink.com"
      click_button "Create Link"
    end

    visit root_path

    fill_in "searchBar", with: "My Link"

    expect(page).to have_selector(".link", count: 1)

    expect(page).to have_content("http://www.mylink.com")
    expect(page).not_to have_content("unsearched link")
    expect(page).not_to have_content("http://www.unsearchedlink.com")
  end
end
