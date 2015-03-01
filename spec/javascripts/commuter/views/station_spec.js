describe('Commuter.Views.Station', function() {
  var view, model, presenter;

  beforeEach(function() {
    model = new Commuter.Models.Station({ id: 'PHIL' });
    presenter = new Commuter.Presenters.Station({ model: model });
  });

  describe('initialize', function() {
    it('listens to model sync', function () {
      spyOn(Commuter.Views.Station.prototype, 'listenTo');
      view = new Commuter.Views.Station({ model: model });
      expect(Commuter.Views.Station.prototype.listenTo).toHaveBeenCalledWith(
        model, 'sync', view.render
      );
    });
  });

  describe('render', function() {
    beforeEach(function() {
      view = new Commuter.Views.Station({ model: model });
    });

    it('uses a station presenter', function() {
      spyOn(Commuter.Presenters, 'Station');
      view.render();
      expect(Commuter.Presenters.Station).toHaveBeenCalledWith({ model: model });
    });

    it('renders the station template', function() {
      spyOn(HoganTemplates['commuter/templates/station'], 'render');
      view.render();
      expect(HoganTemplates['commuter/templates/station'].render).toHaveBeenCalled();
    });
  });
});
