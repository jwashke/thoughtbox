require "rails_helper"

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new

      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid credentials" do
      it "redirects to the root path" do
        user = create(:user, password: "password")

        post :create, params: { session: { email: user.email, password: "password" }}

        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid credentials" do
      it "redirects to the login path" do
        user = create(:user, password: "password")

        post :create, params: { session: { email: user.email, password: "notpassword" }}

        expect(response.status).to eq(302)
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the login path" do
      delete :destroy

      expect(response.status).to eq(302)
      expect(response).to redirect_to(login_path)
    end
  end
end
