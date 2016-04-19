require "oystercard"

describe Oystercard do
  let(:min_balance) { described_class::MIN_BALANCE }
  let(:default_limit) { described_class::DEFAULT_LIMIT }
  let(:oyster) { described_class.new }

  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(oyster.balance).to eq 0
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

  describe "#deduct" do
    it "deducts the fare from balance" do
      oyster.top_up 70
      expect{ oyster.deduct 50 }.to change{ oyster.balance }.by -50
    end
  end

  describe '#in_journey?' do
    it 'is not in journey unless touched in' do
      expect(oyster).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "sets card #in_journey to true." do
      oyster.top_up(default_limit)
      oyster.touch_in
      expect(oyster).to be_in_journey
    end
    it "raises error message if balance is too low" do
      message = "Must have more than £#{min_balance} on your card to touch in."
      expect{ oyster.touch_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    before do
      oyster.top_up(default_limit)
      oyster.touch_in
    end

    it 'sets card #in_journey to false' do
      oyster.touch_out
      expect(oyster).not_to be_in_journey
    end

    it 'deducts the min fare on touch out' do
      expect{ oyster.touch_out }.to change{ oyster.balance }.by -min_balance
    end
  end

end
