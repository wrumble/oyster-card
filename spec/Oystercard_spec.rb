require "oystercard"

describe Oystercard do
  let(:min_fare) { described_class::MIN_FARE}
  let(:min_balance) { described_class::MIN_BALANCE }
  let(:default_limit) { described_class::DEFAULT_LIMIT }
  let(:oyster) { described_class.new }
  let(:entry) { double(:station) }
  let(:exit) { double(:station) }

  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(oyster.balance).to eq 0
    end

    it "creates and empty array of journeys." do
      expect(oyster.journeys).to be_empty
    end
  end

  describe "#top_up" do
    it "increase balance by set amount" do
      expect{ oyster.top_up 1 }.to change{ oyster.balance }.by 1
    end
  end

  describe "#limit_reached" do
    it "raise error if #top_up(amount) puts balance over maximum limit." do
      message = "Top up amount pushes you over your maximum oyster card limit of £#{default_limit}."
      expect{ oyster.top_up 91 }.to raise_error message
    end
  end

  describe "#touch_in" do
    it "raises error message if balance is too low" do
      message = "Must have more than £#{min_balance} on your card to touch in."
      expect{ oyster.touch_in(:entry) }.to raise_error message
    end
  end

  describe '#touch_out' do
    before do
      oyster.top_up(default_limit)
      oyster.touch_in(:entry)
    end

    xit 'deducts the min fare on touch out' do
      expect{ oyster.touch_out(:touch_out) }.to change{ oyster.balance }.by -min_fare
    end
  end

end
