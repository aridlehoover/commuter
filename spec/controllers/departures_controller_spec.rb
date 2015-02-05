require 'rails_helper'

describe DeparturesController do
  let(:stations) { [{'abbr' => '12TH'}, {'abbr' => '16TH'}] }

  describe '#show' do
    context 'when station is found' do
      let(:departures) { double('departures') }
      let(:station_abbr) { '12TH' }

      before do
        expect(Departure).to receive(:find).with(station_abbr).and_return(departures)
      end

      it 'gets departure information from Departure.find' do
        get :show, id: station_abbr
      end

      it 'assigns @station' do
        get :show, id: station_abbr
        expect(assigns(:station)).to eq(departures)
      end

      it 'renders the show template' do
        get :show, id: station_abbr
        expect(response).to render_template('show')
      end
    end

    context 'when station not found' do
      let(:station_abbr) { 'NOTFOUND' }

      before do
        expect(Departure).to receive(:find).with(station_abbr).and_return(nil)
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
