require "rails_helper"

RSpec.describe PhotoDiscoveryService do
  describe ".call" do
    it "creates photo records for discovered files" do
      allow(Dir).to receive(:glob).and_return(
        [
          "/tmp/photo1.jpg",
          "/tmp/photo2.jpg"
        ]
      )

      expect {
        described_class.call
      }.to change(Photo, :count).by(2)
    end
    it "does not create duplicate photo records" do
      allow(Dir).to receive(:glob).and_return(
        [
          "/tmp/photo1.jpg",
          "/tmp/photo2.jpg"
        ]
      )

      described_class.call

      expect {
        described_class.call
      }.not_to change(Photo, :count)
    end

    it "sets status to pending when a photo is created" do
      allow(Dir).to receive(:glob).and_return(
        [
          "/tmp/photo1.jpg"
        ]
      )
      described_class.call
      photo = Photo.first

      expect(photo).to be_present
      expect(photo.status).to eq("pending")
    end
  end
end
