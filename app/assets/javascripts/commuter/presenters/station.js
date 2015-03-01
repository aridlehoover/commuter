Commuter.Presenters.Station = _.extend(Commuter.Presenters.Model, {});

Commuter.Presenters.Station.prototype.abbr = function() {
  return this.model.get('abbr');
};

Commuter.Presenters.Station.prototype.name = function() {
  return this.model.get('name');
};

Commuter.Presenters.Station.prototype.destinations = function() {
  var collection = new Commuter.Collections.Destinations(this.model.get('destinations'));
  var presenter = new Commuter.Presenters.Collection({
    collection: collection,
    modelPresenter: Commuter.Presenters.Destination
  });

  return presenter.models();
};
