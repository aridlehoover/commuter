describe('Commuter.Presenters.Departure', function() {
  var presenter, model;

  beforeEach(function() {
    model = new Backbone.Model({
      id: 1,
      length: 10,
      minutes: 20
    });

    presenter = new Commuter.Presenters.Departure({model: model});
  });

  describe('length', function() {
    it('returns the length attribute', function() {
      expect(presenter.length()).toEqual(model.get('length'));
    });
  });

  describe('minutes', function() {
    it('returns the minutes attribute', function() {
      expect(presenter.minutes()).toEqual(model.get('minutes'));
    });
  });
});
