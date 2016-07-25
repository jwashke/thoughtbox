require "rails_helper"

RSpec.feature "User visits sign up page" do
  context "With valid email and matching passwords" do
    scenario "they are redirected to the links index " do
      visit root_path
      within ".login-form" do
        click_link "Sign Up"
      end

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_button "Sign Up"

      expect(current_path).to eq(root_path)
      within ".navbar" do
        expect(page).to have_content("Logout")
      end
    end
  end

  context "With an email address already registered" do
    scenario "They are redirected back to the sign up page with an error" do
      create(:user, email: "user@example.com")

      visit root_path
      within ".login-form" do
        click_link "Sign Up"
      end

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_button "Sign Up"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Email has already been taken")
    end
  end

  context "With non matching password and confirmation" do
    scenario "They are redirected back to the sign up page with an error" do

      visit root_path
      within ".login-form" do
        click_link "Sign Up"
      end

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "notpassword"
      click_button "Sign Up"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("...")
    end
  end
end
