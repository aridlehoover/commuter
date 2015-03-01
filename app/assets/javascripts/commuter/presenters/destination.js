Commuter.Presenters.Destination = _.extend(Commuter.Presenters.Model, {});

Commuter.Presenters.Destination.prototype.abbr = function() {
  return this.model.get('abbr');
};

Commuter.Presenters.Destination.prototype.name = function() {
  return this.model.get('name');
};

Commuter.Presenters.Destination.prototype.departures = function() {
  var collection = new Commuter.Collections.Departures(this.model.get('departures'));
  var presenter = new Commuter.Presenters.Collection({
    collection: collection,
    modelPresenter: Commuter.Presenters.Departure
  });

  return presenter.models();
};
