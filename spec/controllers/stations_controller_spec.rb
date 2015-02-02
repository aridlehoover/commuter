require 'rails_helper'

describe StationsController do
  describe '#index' do
    let(:stations) { [{'abbr' => '12TH'}, {'abbr' => '16TH'}] }

    before do
      expect(Station).to receive(:all).and_return(stations)
    end

    it 'gets stations from Station.all' do
      get :index
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it "assigns @stations" do
      get :index
      expect(assigns(:stations)).to eq(stations)
    end
  end
end
