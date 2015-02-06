require 'rails_helper'

describe DeparturesController do
  describe '#show' do
    context 'when station is found' do
      let(:station) { { "name" => name, "abbr" => abbr} }
      let(:name) { "Pittsburg/Bay Point"}
      let(:abbr) { 'PITT' }
      let(:serialized_station) {
        {
          "name" => name,
          "abbr" => abbr,
          "destinations" => []
        }
      }

      before do
        expect(DepartureSerializer).to receive(:new).with(station).and_return(serialized_station)
        expect(Departure).to receive(:find).with(abbr).and_return(station)
      end

      it 'gets departure information from Departure.find' do
        get :show, id: abbr
      end

      it 'assigns @station' do
        get :show, id: abbr
        expect(assigns(:station)).to eq(serialized_station)
      end

      it 'renders the show template' do
        get :show, id: abbr
        expect(response).to render_template('show')
      end
    end

    context 'when station not found' do
      let(:abbr) { 'NOTFOUND' }

      before do
        expect(DepartureSerializer).to receive(:new).with(nil).and_return(nil)
        expect(Departure).to receive(:find).with(abbr).and_return(nil)
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
