describe('Commuter.Presenters.Station', function() {
  var presenter, model;

  beforeEach(function() {
    model = new Backbone.Model({
      id: 1,
      abbr: 'PHIL',
      name: 'Pleasant Hill / Contra Costa Center'
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
});
