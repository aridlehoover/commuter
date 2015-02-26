require 'rails_helper'

describe StationsController do
  let(:stations) { [{'abbr' => '12TH'}, {'abbr' => '16TH'}] }

  describe '#index' do
    before do
      expect(Station).to receive(:all).and_return(stations)
    end

    it 'gets stations from Station.all' do
      get :index
    end

    it "assigns @stations" do
      get :index
      expect(assigns(:stations)).to eq(stations)
    end

    it 'renders JSON' do
      get :index
      expect(JSON.parse(response.body)).to eq(stations)
    end
  end

  describe '#show' do
    context 'when station is found' do
      let(:station) { { "name" => name, "abbr" => abbr, "destinations" => [] } }
      let(:name) { "Pittsburg/Bay Point" }
      let(:abbr) { 'PITT' }
      let(:serialized_departures) { { name: name, abbr: abbr, destinations: [] } }

      before do
        expect(Station).to receive(:find).with(abbr).and_return(station)
      end

      it 'gets departure information from Station.find' do
        get :show, id: abbr
      end

      it 'assigns @station' do
        get :show, id: abbr
        expect(assigns(:station)).to eq(serialized_departures)
      end

      it 'renders the show template' do
        get :show, id: abbr
        expect(response).to render_template('show')
      end
    end

    context 'when departures not found' do
      let(:abbr) { 'NOTFOUND' }

      before do
        expect(StationSerializer).to receive(:new).with(nil).and_return(nil)
        expect(Station).to receive(:find).with(abbr).and_return(nil)
      end

      it 'redirects to stations#index' do
        get :show, id: abbr
        expect(response).to redirect_to('/stations')
      end

      it 'sets the flash error' do
        get :show, id: abbr
        expect(flash[:error]).to be_present
      end
    end
  end
end
