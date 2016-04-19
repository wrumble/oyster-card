require 'station'

describe Station do
  let(:station) { described_class.new(:name, 1) }

  describe '#initialize' do
    it 'creates a station with a zone' do
      expect(station.zone).not_to be nil
    end
    it 'creates a station with a name' do
      expect(station.name).to be :name
    end
  end


end