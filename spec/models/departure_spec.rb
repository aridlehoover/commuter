require 'rails_helper'

describe Departure do
  describe '.find' do
    context 'when the station is found' do
      let(:station_abbr) { '12TH' }
      let(:station_name) { '12th St. Oakland City Center' }

      before do
        expect(HTTParty).to receive(:get)
          .with("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_abbr}&key=#{ENV['BART_API_KEY']}")
          .and_return({'root' => {'station' => {'abbr' => station_abbr, 'name' => station_name}}})
      end

      it 'calls the correct BART API' do
        Departure.find station_abbr
      end

      it 'returns station information' do
        station = Departure.find station_abbr
        expect(station).to eq({'abbr' => station_abbr, 'name' => station_name})
      end
    end

    context 'when station not found' do
      let(:station_abbr) { 'NOTFOUND' }

      before do
        expect(HTTParty).to receive(:get)
          .with("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_abbr}&key=#{ENV['BART_API_KEY']}")
          .and_return({'root' => {'message' => {'error' => {'text' => 'Invalid orig'}}}})
      end

      it 'should return nil' do
        station = Departure.find station_abbr
        expect(station).to be_nil
      end
    end
  end
end
