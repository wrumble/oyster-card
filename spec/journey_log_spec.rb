require "journey_log"

describe JourneyLog do

  let(:journey_class) { double :journey_class }
  subject { JourneyLog.new journey_class }

  it "initializes with a journey_class" do
    expect(subject.journey_class).to eq journey_class
  end

  describe "#start" do
    it ""

  end

  describe "#current_journey" do

  end

  describe "#finish" do

  end

  describe "#journeys" do

  end

end
