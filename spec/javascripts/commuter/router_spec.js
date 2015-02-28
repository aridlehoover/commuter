describe('Commuter.Router', function() {
  var router, collection;

  beforeEach(function() {
    router = new Commuter.Router();
    collection = new Commuter.Collections.Stations();
  });

  describe('showStations', function() {
    it('creates the right collection', function() {
      spyOn(Commuter.Collections.Stations.prototype, 'initialize').and.callThrough();
      router.showStations();
      expect(Commuter.Collections.Stations.prototype.initialize).toHaveBeenCalled();
    });

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
});
