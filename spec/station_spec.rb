require 'station'

describe Station do
  describe "#name" do
    it "returns the name of the station" do
      it { is_expected.to respond_to :name}
    end
  end
  describe "#zone" do
    it "returns the zone of the station" do
      it {is_expected.to respond_to :zone}
    end
  end
end
