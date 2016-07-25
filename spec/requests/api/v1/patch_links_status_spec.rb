require "rails_helper"

RSpec.describe "PATCH /api/v1/links" do
  context "An unread link" do
    it "updates the read attribute to true and returns 204" do
      link = create(:link)

      patch "/api/v1/links/#{link.id}", params: { update: "read" }

      expect(response.status).to eq(204)
      expect(Link.last.read).to be(true)
    end
  end
end
