Commuter.Presenters.Departure = _.extend(Commuter.Presenters.Model, {});

Commuter.Presenters.Departure.prototype.length = function() {
  return this.model.get('length');
};

Commuter.Presenters.Departure.prototype.minutes = function() {
  return this.model.get('minutes');
};
