require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :url }
  end

  describe "#update_status" do
    context "with read as the status" do
      it "updates read to true" do
        link = create(:link, read: false)

        link.update_status("read")
        expect(link.read).to be(true)
      end
    end

    context "with unread as status" do
      it "updates read to false" do
        link = create(:link, read: true)

        link.update_status("unread")
        expect(link.read).to be(false)
      end
    end
  end
end
