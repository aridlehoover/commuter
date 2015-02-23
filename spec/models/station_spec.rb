require 'rails_helper'

describe Station do
  describe '.all' do
    before do
      expect(HTTParty).to receive(:get)
        .with('http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V')
        .and_return({'root' => {'stations' => {'station' => [{'abbr' => '12TH'}, {'abbr' => '16TH'}]}}})
    end

    it 'calls the correct BART API' do
      Station.all
    end

    it 'returns an array of stations hashes' do
      stations = Station.all

      expect(stations.length).to eq(2)
      expect(stations[0]['abbr']).to eq('12TH')
      expect(stations[1]['abbr']).to eq('16TH')
    end
  end
end
