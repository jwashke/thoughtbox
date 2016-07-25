require "rails_helper"

RSpec.feature "User visits sign up page" do
  context "With valid email and password" do
    scenario "they are redirected to the links index" do
      user = create(:user, email: "user@example.com")

      visit login_path
      within ".login-form" do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "password"
        click_button "Login"
      end

      expect(current_path).to eq(root_path)
      within ".navbar" do
        expect(page).to have_content("Logout")
      end
    end
  end

  context "With invalid email or password" do
    xscenario "They are redirected back to the sign up page with an error" do
      create(:user, email: "user@example.com")

      visit root_path
      within ".login-form" do
        click_link "Sign Up"
      end

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "notpassword"
      click_button "Login"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Invalid email/password combination")
    end
  end
end
