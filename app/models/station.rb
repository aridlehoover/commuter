class Station
  def self.all
    stations = HTTParty.get("http://api.bart.gov/api/stn.aspx?cmd=stns&key=#{ENV['BART_API_KEY']}")
    stations['root']['stations']['station']
  end

  def self.find station_abbr
    station = HTTParty.get("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_abbr}&key=#{ENV['BART_API_KEY']}")
    return nil if station['root']['message']
    station['root']['station']
  end
end
