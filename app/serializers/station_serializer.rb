class StationSerializer
  attr_reader :bart_etd

  def initialize(bart_etd)
    @bart_etd = bart_etd
  end

  def as_json
    return nil unless bart_etd

    {
      name: bart_etd["name"],
      abbr: bart_etd["abbr"],
      destinations: destinations
    }
  end

  private

  def destinations
    return [] unless bart_etd["etd"]
    return [ destination(bart_etd["etd"]) ] unless bart_etd["etd"].kind_of?(Array)

    destinations = []
    bart_etd["etd"].each { |d| destinations << destination(d) }
    destinations
  end

  def destination(dest)
    {
      name: dest["destination"],
      abbr: dest["abbreviation"],
      estimates: estimates(dest)
    }
  end

  def estimates(dest)
    return [] unless dest["estimate"]
    return [ estimate(dest["estimate"]) ] unless dest["estimate"].kind_of?(Array)

    estimates = []
    dest["estimate"].each { |e| estimates << estimate(e) }
    estimates
  end

  def estimate(est)
    {
      minutes: est["minutes"],
      length: est["length"]
    }
  end
end
