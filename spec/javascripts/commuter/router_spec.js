describe('Commuter.Router', function() {
  var router, collection;

  beforeEach(function() {
    Commuter.App = {
      Repository: {
        stations = new Commuter.Collections.Stations();
      }
    }

    router = new Commuter.Router();
  });

  describe('showStations', function() {
    it('creates the right view', function() {
      spyOn(Commuter.Views.Stations.prototype, 'initialize').and.callThrough();
      router.showStations();
      expect(Commuter.Views.Stations.prototype.initialize).toHaveBeenCalled();
    });

    it('fetches the collection', function() {
      spyOn(Commuter.Collections.Stations.prototype, 'fetch')
      router.showStations();
      expect(Commuter.Collections.Stations.prototype.fetch).toHaveBeenCalled();
    });
  });

  describe('showStation', function() {
    it('creates the right model', function() {
      spyOn(Commuter.Models.Station.prototype, 'initialize').and.callThrough();
      router.showStation();
      expect(Commuter.Models.Station.prototype.initialize).toHaveBeenCalled();
    });

    it('creates the right view', function() {
      spyOn(Commuter.Views.Station.prototype, 'initialize').and.callThrough();
      router.showStation();
      expect(Commuter.Views.Station.prototype.initialize).toHaveBeenCalled();
    });

    it('fetches the model', function() {
      spyOn(Commuter.Models.Station.prototype, 'fetch')
      router.showStation();
      expect(Commuter.Models.Station.prototype.fetch).toHaveBeenCalled();
    });
  });
});
