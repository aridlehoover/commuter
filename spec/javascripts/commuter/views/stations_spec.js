describe('Commuter.Views.Stations', function() {
  var view, collection, presenter;

  beforeEach(function() {
    collection = new Commuter.Collections.Stations(
      {id: 1}, {id: 2}, {id: 3}
    );

    presenter = new Commuter.Presenters.Collection({
      collection: collection,
      modelPresenter: Commuter.Presenters.Model
    });
  });

  describe('initialize', function() {
    it('listens to collection sync', function () {
      spyOn(Commuter.Views.Stations.prototype, 'listenTo');
      view = new Commuter.Views.Stations({collection: collection});
      expect(Commuter.Views.Stations.prototype.listenTo).toHaveBeenCalledWith(
        collection, 'sync', view.render
      );
    });
  });

  describe('render', function() {
    beforeEach(function() {
      view = new Commuter.Views.Stations({collection: collection});
    });

    it('uses a collection presenter', function() {
      spyOn(Commuter.Presenters, 'Collection');
      view.render();
      expect(Commuter.Presenters.Collection).toHaveBeenCalledWith({
        collection: collection,
        modelPresenter: Commuter.Presenters.Station
      });
    });

    it('renders the right template', function() {
      spyOn(HoganTemplates['commuter/templates/stations'], 'render');
      view.render();
      expect(HoganTemplates['commuter/templates/stations'].render).toHaveBeenCalled();
    });
  });
});
