require 'journey'
require 'oystercard'

describe Journey do
  
  let(:entrystation) {double :entrystation}
  let(:exitstation) {double :exitstation}
  #let(:oystercard) {double(:oystercard, top_up:}
    oy = Oystercard.new

    describe '#journeys' do
      it "stores entry and exit stations in a hash" do
        oy.top_up(5)
        oy.touch_in(entrystation)
        oy.touch_out(exitstation)
        expect(subject.journeys).to eq [journey]
      end

      it 'starts with an empty hash' do
        expect(subject.journeys).to be_empty
      end
    end

    describe '#journey_history' do
      it 'stores all journeys in journey_history' do
        oy.top_up(10)
        oy.touch_in(entrystation)
        oy.touch_out(exitstation)
        oy.touch_in(entrystation)
        oy.touch_out(exitstation)
        expect(subject.journeys).to eq [journey, journey]
      end
    end

    it "returns false on in_journey" do
      oy.top_up(5)
      oy.touch_in(entrystation)
      oy.touch_out(exitstation)
      expect(subject.in_journey?).to eq false
    end

    it "remembers the last station" do
      oy.top_up(5)
      oy.touch_in(entrystation)
      oy.touch_out(exitstation)
      expect(subject.journeys.first[:exit_station]).to eq exitstation
    end

    describe '#in_journey?' do
      it "returns false if we are not in a journey" do
        expect(subject.in_journey?).to eq false
      end

      it "returns true on in_journey" do
        oy.top_up(5)
        oy.touch_in(entrystation)
        expect(subject.in_journey?).to eq true
      end

      it "remembers the station after it touched in" do
        oy.top_up(5)
        oy.touch_in(entrystation)
        expect(subject.journeys.first[:entry_station]).to eq entrystation
      end
    end
end
