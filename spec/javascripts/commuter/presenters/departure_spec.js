describe('Commuter.Presenters.Departure', function() {
  var presenter, model;

  beforeEach(function() {
    model = new Backbone.Model({ id: 1 });
    presenter = new Commuter.Presenters.Departure({model: model});
  });

  describe('length', function() {
    it('returns An 8 car train', function() {
      model.set('length', 8);
      expect(presenter.length()).toEqual('An 8 car train');
    });

    it('returns A 10 car train', function() {
      model.set('length', 10);
      expect(presenter.length()).toEqual('A 10 car train');
    });
  });

  describe('minutes', function() {
    it('returns now for imminent departure', function() {
      model.set('minutes', 'Leaving');
      expect(presenter.minutes()).toEqual('now');
    });

    it('returns in 1 minute', function() {
      model.set('minutes', 1);
      expect(presenter.minutes()).toEqual('in 1 minute');
    });

    it('returns in 20 minutes', function() {
      model.set('minutes', 20);
      expect(presenter.minutes()).toEqual('in 20 minutes');
    });
  });

});
