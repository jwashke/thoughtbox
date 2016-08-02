require "rails_helper"

RSpec.describe LinksController, type: :controller do

  before(:each) do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    it "redirects to the root path" do
      post :create, link: { name: "link", url: "http://link.com" }

      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
