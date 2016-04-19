require "journey"

describe Journey do
  let(:journey) { described_class.new(:entry_station) }

  describe '#initialize' do
    it 'sets in_journey status to true' do
      expect(journey).to be_in_journey
    end

    it 'store a value into entry_station variable' do
      expect(journey.entry_station).to be :entry_station
    end
  end








  describe '#in_journey?' do
    xit 'is not in journey unless touched in' do
      expect(oyster).not_to be_in_journey
    end
  end

    xit 'sets card #in_journey to false' do
      oyster.touch_out(:touch_out)
      expect(oyster).not_to be_in_journey
    end


      describe '#current_journey' do
    before do
      oyster.top_up(default_limit)
      oyster.touch_in(:entry)
      oyster.touch_out(:exit)
    end
    xit 'current_journey hash includes entry_station' do
      expect(oyster.journeys[0]).to include :entry
    end
    xit 'current_journey hash includes exit_station' do
      expect(oyster.journeys[0][:entry]).to be :exit
    end
  end

      xit 'sets #entry_station to nil on touch out' do
      oyster.touch_out(:touch_out)
      expect(oyster.entry_station).to be nil
    end


end