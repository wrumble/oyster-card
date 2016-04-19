require "oystercard"

describe Oystercard do


  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "increase balance by set amount" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  describe "#limit_reached" do
    it "raise error if #top_up(amount) puts balance over maximum limit." do

      message = "Top up amount pushes you over your maximum oyster card limit of £#{Oystercard::DEFAULT_LIMIT}."
      expect{ subject.top_up 91 }.to raise_error message
    end
  end

  describe "#deduct" do
    it "deducts the fare from balance" do
      subject.top_up 70
      expect{ subject.deduct 50 }.to change{ subject.balance }.by -50
    end
  end

  describe '#in_journey?' do
    it 'is not in journey unless touched in' do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "sets card #in_journey to true." do
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it "raises error message if balnce is too low" do
      message = "Must have more than £#{Oystercard::MIN_BALANCE} on your card to touch in."
      expect{ subject.touch_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'sets card #in_journey to false' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
