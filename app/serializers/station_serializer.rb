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
      departures: departures(dest)
    }
  end

  def departures(dest)
    return [] unless dest["estimate"]
    return [ departure(dest["estimate"]) ] unless dest["estimate"].kind_of?(Array)

    departures = []
    dest["estimate"].each { |e| departures << departure(e) }
    departures
  end

  def departure(est)
    {
      minutes: est["minutes"],
      length: est["length"]
    }
  end
end
