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

  describe '.find' do
    context 'when the station is found' do
      let(:station_abbr) { '12TH' }
      let(:station_name) { '12th St. Oakland City Center' }

      before do
        expect(HTTParty).to receive(:get)
          .with("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_abbr}&key=MW9S-E7SL-26DU-VV8V")
          .and_return({'root' => {'station' => {'abbr' => station_abbr, 'name' => station_name}}})
      end

      it 'calls the correct BART API' do
        Station.find station_abbr
      end

      it 'returns station information' do
        station = Station.find station_abbr

        expect(station).to eq({'abbr' => station_abbr, 'name' => station_name})
      end
    end

    context 'when station not found' do
      let(:station_abbr) { 'NOTFOUND' }

      before do
        expect(HTTParty).to receive(:get)
          .with("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_abbr}&key=MW9S-E7SL-26DU-VV8V")
          .and_return({'root' => {'message' => {'error' => {'text' => 'Invalid orig'}}}})
      end

      it 'should return nil' do
        station = Station.find station_abbr

        expect(station).to be_nil
      end
    end
  end
end
