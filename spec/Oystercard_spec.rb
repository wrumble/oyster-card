require "oystercard"

describe Oystercard do

  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq 0
    end
  end

end
