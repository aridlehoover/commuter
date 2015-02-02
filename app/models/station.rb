class Station
  def self.all
    stations = HTTParty.get('http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V')
    stations['root']['stations']['station']
  end
end
