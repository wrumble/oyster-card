require 'journey'

describe Journey do
    describe '#journeys' do
      it "stores entry and exit stations in a hash" do
        subject.top_up(5)
        subject.touch_in(entrystation)
        subject.touch_out(exitstation)
        expect(subject.journeys).to eq [journey]
      end

      it 'starts with an empty hash' do
        expect(subject.journeys).to be_empty
      end
    end

    describe '#journey_history' do
      it 'stores all journeys in journey_history' do
        subject.top_up(10)
        subject.touch_in(entrystation)
        subject.touch_out(exitstation)
        subject.touch_in(entrystation)
        subject.touch_out(exitstation)
        expect(subject.journeys).to eq [journey, journey]
      end
    end

    it "returns false on in_journey" do
      subject.top_up(5)
      subject.touch_in(entrystation)
      subject.touch_out(exitstation)
      expect(subject.in_journey?).to eq false
    end

    it "remembers the last station" do
      subject.top_up(5)
      subject.touch_in(entrystation)
      subject.touch_out(exitstation)
      expect(subject.journeys.first[:exit_station]).to eq exitstation
    end

    describe '#in_journey?' do
      it "returns false if we are not in a journey" do
        expect(subject.in_journey?).to eq false
      end

      it "returns true on in_journey" do
        subject.top_up(5)
        subject.touch_in(entrystation)
        expect(subject.in_journey?).to eq true
      end

      it "remembers the station after it touched in" do
        subject.top_up(5)
        subject.touch_in(entrystation)
        expect(subject.journeys.first[:entry_station]).to eq entrystation
      end
    end
end
