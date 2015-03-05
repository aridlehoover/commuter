Commuter.Presenters.Departure = function(options) {
  var options = options ? options : {};
  this.model = options.model;
};

Commuter.Presenters.Departure.prototype.length = function() {
  return this.model.get('length');
};

Commuter.Presenters.Departure.prototype.minutes = function() {
  return this.model.get('minutes');
};
