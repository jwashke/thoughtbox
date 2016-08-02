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

    visit root_path

    click_on "Mark as read"

    wait_for_ajax_to_finish

    expect(page).to have_content("Mark as unread")
  end

  scenario "They can mark a link as unread and the button changes to read", js: true do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit root_path

    within (".new-link-form") do
      fill_in "Name", with: "My Link"
      fill_in "URL", with: "http://www.mylink.com"
      click_button "Create Link"
    end

    visit root_path

    click_on "Mark as read"

    wait_for_ajax_to_finish

    click_on "Mark as unread"

    wait_for_ajax_to_finish

    expect(page).to have_content("Mark as read")
  end
end
