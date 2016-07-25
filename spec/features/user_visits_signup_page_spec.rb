require "rails_helper"

RSpec.feature "User visits sign up page" do
  context "With valid info" do
    scenario "they are redirected to the links index " do

      visit root_path
      click_link "Sign Up"

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_link "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Logout")
    end
  end
end
