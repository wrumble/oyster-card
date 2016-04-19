require 'oystercard'
describe Oystercard do
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
      message = "you are trying to top-up with the amount that is over the limit"
      expect {subject.top_up}.to raise_error message
    end
  end

end
