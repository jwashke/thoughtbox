require "rails_helper"

RSpec.feature "User visits home page" do
  context "As a guest" do
    scenario "they are redirected to the login page" do

      visit root_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Please Login to Continue")
    end
  end
end
