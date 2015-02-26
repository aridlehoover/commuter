Commuter.Presenters.Station = _.extend(Commuter.Presenters.Model, {});

Commuter.Presenters.Station.prototype.abbr = function() {
  return this.model.get('abbr');
};

Commuter.Presenters.Station.prototype.name = function() {
  return this.model.get('name');
};
