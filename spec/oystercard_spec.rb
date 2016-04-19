require 'oystercard'
describe Oystercard do
  let(:station) {double :station}
  describe '#initialize balance' do
    it "has a variable balance and it is set to 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument}
    it "can be topped up" do
      expect {subject.top_up(3)}.to change{ subject.balance}.by(3)
    end
    it "is raises an error if the top-up exceeds the limit" do
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      message = "maximum limit is £#{limit}"
      expect {subject.top_up(1)}.to raise_error message
    end
  end

  describe '#in_journey?' do
    it "returns false if we are not in a journey" do
      expect(subject.in_journey?).to eq false
    end
  end
  describe '#touch_in' do
    it "returns true on in_journey" do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
    it "raises an error if the min balance less the £1" do
      min = Oystercard::MIN_BAL
      expect {subject.touch_in}.to raise_error "min balance has to be >£#{min}"
    end
    it "remembers the station after it touched in" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch_out' do
    it "returns false on in_journey" do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it "reduces the balance by minimum fare" do
      expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN_FARE)
    end
  end

end
