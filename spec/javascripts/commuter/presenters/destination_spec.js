describe('Commuter.Presenters.Destination', function() {
  var presenter, model;

  beforeEach(function() {
    model = new Backbone.Model({
      id: 1,
      abbr: 'PHIL',
      name: 'Pleasant Hill / Contra Costa Center',
      departures: [ { length: 10, minutes: 20 } ]
    });

    presenter = new Commuter.Presenters.Destination({model: model});
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

  describe('departures', function() {
    it('returns an array of departure presenters', function() {
      expect(presenter.departures()[0]).toEqual(
        jasmine.any(Commuter.Presenters.Departure)
      );
    });
  });
});
