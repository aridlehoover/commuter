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

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    context 'when station is found' do
      let(:station) { stations[0] }
      let(:station_abbr) { '12TH' }

      before do
        expect(Station).to receive(:find).and_return(station)
      end

      it 'gets station info from Station.find' do
        get :show, id: station_abbr
      end

      it 'assigns @station' do
        get :show, id: station_abbr
        expect(assigns(:station)).to eq(station)
      end

      it 'renders the show template' do
        get :show, id: station_abbr
        expect(response).to render_template('show')
      end
    end

    context 'when station not found' do
      let(:station_abbr) { 'NOTFOUND' }

      before do
        expect(Station).to receive(:find).and_return(nil)
      end

      it 'redirects to stations#index' do
        get :show, id: station_abbr
        expect(response).to redirect_to('/stations')
      end

      it 'sets the flash error' do
        get :show, id: station_abbr
        expect(flash[:error]).to be_present
      end
    end
  end
end
