class Station
  def self.all
    stations = HTTParty.get("http://api.bart.gov/api/stn.aspx?cmd=stns&key=#{ENV['BART_API_KEY']}")
    stations['root']['stations']['station']
  end
end
