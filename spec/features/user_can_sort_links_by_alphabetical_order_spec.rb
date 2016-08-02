require "rails_helper"

RSpec.feature "User can view links alphabetically" do
  scenario "They see the links alphabetically", js: true do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit root_path

    within (".new-link-form") do
      fill_in "Name", with: "z"
      fill_in "URL", with: "http://www.z.com"
      click_button "Create Link"
    end

    within (".new-link-form") do
      fill_in "Name", with: "a"
      fill_in "URL", with: "http://www.a.com"
      click_button "Create Link"
    end

    expect(page.body.index("http://www.z.com")).to be < page.body.index("http://www.a.com")

    click_button "Sort Alphabetically"

    expect(page.body.index("http://www.z.com")).to be > page.body.index("http://www.a.com")
  end
end
