require 'journey'

describe Journey do

  let(:entrystation) {double :entrystation}
  let(:exitstation) {double :exitstation}
  let(:journey){ {entry_station: entrystation, exit_station: exitstation} }
  let(:oystercard) {double(:oystercard, top_up: true, touch_in: subject.entry_station(entrystation), touch_out: subject.exit_station(exitstation))}

    describe '#journeys' do
      it "stores entry and exit stations in a hash" do
        oystercard.touch_in
        oystercard.touch_out
        expect(subject.journeys).to eq [journey]
      end

      it 'starts with an empty hash' do
        expect(subject.journeys).to be_empty
      end
    end

    describe '#journey_history' do
      it 'stores all journeys in journey_history' do
        oystercard.touch_in
        oystercard.touch_out
        oystercard.touch_in
        oystercard.touch_out
        expect(subject.journeys).to eq [journey, journey]
      end
    end

    it "returns false on in_journey" do
      oystercard.touch_in
      oystercard.touch_out
      expect(subject.in_journey?).to eq false
    end

    it "remembers the last station" do
      oystercard.touch_in
      oystercard.touch_out
      expect(subject.journeys.first[:exit_station]).to eq exitstation
    end

    describe '#in_journey?' do
      it "returns false if we are not in a journey" do
        expect(subject.in_journey?).to eq false
      end

      it "returns true on in_journey" do
        oystercard.touch_in
        expect(subject.in_journey?).to eq true
      end

      it "remembers the station after it touched in" do
        oystercard.touch_in
        expect(subject.journeys.first[:entry_station]).to eq entrystation
      end
    end
end
