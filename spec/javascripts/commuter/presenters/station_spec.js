describe('Commuter.Presenters.Station', function() {
  var presenter, model;

  beforeEach(function() {
    model = new Backbone.Model({
      id: 1,
      abbr: 'PHIL',
      name: 'Pleasant Hill / Contra Costa Center',
      destinations: [ { abbr: 'DALY', name: 'Daly City', estimates: [] } ]
    });

    presenter = new Commuter.Presenters.Station({model: model});
  });

  describe('abbr', function() {
    it('returns the abbr attribute', function() {
      expect(presenter.abbr()).toEqual(model.get('abbr'));
    });
  });

  describe('name', function() {
    it('returns the name attribute', function() {
      expect(presenter.name()).toEqual(model.get('name'));
    });
  });

  describe('destinations', function() {
    it('returns an array of destination presenters', function() {
      expect(presenter.destinations()[0]).toEqual(
        jasmine.any(Commuter.Presenters.Destination)
      );
    });
  });
});
