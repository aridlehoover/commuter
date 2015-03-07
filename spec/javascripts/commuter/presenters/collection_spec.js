TestPresenter = function(options) {
  var options = options ? options : {};
  this.model = options.model;
}

TestPresenter.prototype.squared = function() {
  return this.model.id * this.model.id
}

describe('Commuter.Presenters.Collection', function() {
  var presenter, collection;

  beforeEach(function() {
    collection = new Backbone.Collection([{id: 1}, {id: 2}, {id: 3}]);

    presenter = new Commuter.Presenters.Collection({
      collection: collection,
      modelPresenter: TestPresenter
    });
  });

  describe('models', function() {
    it('presents each model', function() {
      presentedModels = presenter.models();
      expect(presentedModels[0]).toEqual(jasmine.any(TestPresenter));
      expect(presentedModels[1]).toEqual(jasmine.any(TestPresenter));
      expect(presentedModels[2]).toEqual(jasmine.any(TestPresenter));
    });

    it('allows presenter methods to run', function() {
      presentedModels = presenter.models();
      expect(presentedModels[0].squared()).toEqual(1);
      expect(presentedModels[1].squared()).toEqual(4);
      expect(presentedModels[2].squared()).toEqual(9);
    });
  });
});
