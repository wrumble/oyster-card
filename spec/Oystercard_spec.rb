require "oystercard"

describe Oystercard do

  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "increase balance by set amount" do
      oy = Oystercard.new
      oy.top_up(10)
      expect(subject.balance).to eq 10.00
    end
  end

end
