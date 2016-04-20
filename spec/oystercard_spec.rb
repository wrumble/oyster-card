require 'oystercard'
describe Oystercard do
  let(:entrystation) {double :entrystation}
  let(:exitstation) {double :exitstation}
  let(:journey){ {entry_station: entrystation, exit_station: exitstation} }

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

  describe '#touch_in' do
    it "raises an error if the min balance less the £1" do
      min = Oystercard::MIN_BAL
      expect {subject.touch_in(entrystation)}.to raise_error "min balance has to be >£#{min}"
    end
  end

  describe '#touch_out' do
    it "reduces the balance by minimum fare" do
      subject.top_up(5)
      subject.touch_in(entrystation)
      expect {subject.touch_out(exitstation)}.to change{subject.balance}.by(-Oystercard::MIN_FARE)
    end
  end
end
