require "rails_helper"

RSpec.describe UsersController do

  describe "GET #new" do
    it "renders the new page" do
      get :new
      expect(response).to render_template(:new)
      expect(response.status).to eq(200)
    end
    it "assigns a new user to user" do
      get :new
      expect(assigns(:user).class).to eq(User)
    end
  end

  describe "POST #create" do
    context "with valid user info" do
      it "sets the user id in the session" do
        post :create, user: {
          email:       "email@example.com",
          password:    "password"
        }
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "redirects to the dashboard" do
        post :create, user: {
          email:       "email@example.com",
          password:    "password"
        }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid user info" do
      it "sets the flash message with the users errors" do
        post :create, user: {
          email:       "",
          password:    ""
        }

        expect(flash[:errors]).to eq("Password can't be blank, Email can't be blank")
      end

      it "redirects the user to their last page" do
        post :create, user: {
          email:       "",
          password:    ""
        }

        expect(response).to redirect_to(new_user_path)
      end
    end
  end
end
