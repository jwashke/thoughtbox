require "rails_helper"

RSpec.feature "User can mark a link as read or unread" do
  scenario "They can view links by status", js: true do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit root_path

    within (".new-link-form") do
      fill_in "Name", with: "My Link"
      fill_in "URL", with: "http://www.mylink.com"
      click_button "Create Link"
    end

    visit root_path

    click_button "Read"

    expect(page).not_to have_content("My Link")
    expect(page).not_to have_content("http://www.mylink.com")

    click_button "Unread"

    expect(page).to have_content("My Link")
    expect(page).to have_content("http://www.mylink.com")

    click_button "All"

    expect(page).to have_content("My Link")
    expect(page).to have_content("http://www.mylink.com")

    click_on "Mark as read"

    click_button "Read"

    expect(page).to have_content("My Link")
    expect(page).to have_content("http://www.mylink.com")

    click_button "Unread"

    expect(page).not_to have_content("My Link")
    expect(page).not_to have_content("http://www.mylink.com")

    click_button "All"

    expect(page).to have_content("My Link")
    expect(page).to have_content("http://www.mylink.com")
  end
end
