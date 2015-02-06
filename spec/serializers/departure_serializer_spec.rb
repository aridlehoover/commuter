require 'rails_helper'

describe DepartureSerializer do
  let(:serializer) { DepartureSerializer.new(response) }
  let(:response) {
    {
      "name" => name,
      "abbr" => abbr,
      "etd"  => etd
    }
  }
  let(:name) { "12th St. Oakland City Center" }
  let(:abbr) { "12TH" }
  let(:etd) { nil } # defined below
  let(:destination) {
    {
      "destination"=>"Pittsburg/Bay Point",
      "abbreviation"=>"PITT",
      "estimate"=> estimates
    }
  }
  let(:estimates) { nil } # defined below
  let(:estimate) {
    {
      "minutes"=>"5",
      "platform"=>"2",
      "direction"=>"South",
      "length"=>"6",
      "color"=>"YELLOW",
      "hexcolor"=>"#ffff33",
      "bikeflag"=>"1"
    }
  }

  before do
    @json = serializer.as_json
  end

  context "when the input is nil" do
    it "returns nil" do
      expect(DepartureSerializer.new(nil).as_json).to be_nil
    end
  end

  context "when the input is not nil" do
    it "has a name and abbreviation" do
      expect(@json[:name]).to eq(name)
      expect(@json[:abbr]).to eq(abbr)
    end
  end

  context "when there are no destinations" do
    let(:etd) { nil }

    it "returns an empty array" do
      expect(@json[:destinations].kind_of?(Array)).to eq(true)
      expect(@json[:destinations].count).to eq(0)
    end
  end

  context "when there is a single destinations" do
    let(:etd) { destination }

    it "returns an array with one destination in it" do
      expect(@json[:destinations].kind_of?(Array)).to eq(true)
      expect(@json[:destinations].count).to eq(1)
    end
  end

  context "when there are multiple destinations" do
    let(:etd) { [ destination, destination ] }

    it "returns an array with all of the destinations" do
      expect(@json[:destinations].kind_of?(Array)).to eq(true)
      expect(@json[:destinations].count).to eq(2)
    end

    context "when there are no estimates" do
      let(:estimates) { nil }

      it "returns an empty array" do
        expect(@json[:destinations][0][:estimates].kind_of?(Array)).to eq(true)
        expect(@json[:destinations][0][:estimates].count).to eq(0)
      end
    end

    context "when there is one estimate" do
      let(:estimates) { estimate }

      it "returns an array with all of the destinations" do
        expect(@json[:destinations][0][:estimates].kind_of?(Array)).to eq(true)
        expect(@json[:destinations][0][:estimates].count).to eq(1)
      end
    end

    context "when there are multiple estimates" do
      let(:estimates) { [ estimate, estimate ] }

      it "returns an array with all of the destinations" do
        expect(@json[:destinations][0][:estimates].kind_of?(Array)).to eq(true)
        expect(@json[:destinations][0][:estimates].count).to eq(2)
      end
    end
  end
end
