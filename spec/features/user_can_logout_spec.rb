require "rails_helper"

RSpec.feature "User logs out" do
  scenario "They are redirected to the login page" do
    user = create(:user, email: "user@example.com")

    visit login_path
    within ".login-form" do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      click_button "Login"
    end

    click_link "Logout"

    expect(current_path).to eq(login_path)
    within ".navbar" do
      expect(page).to have_content("Login")
      expect(page).to have_content("Sign Up")
    end
  end
end
