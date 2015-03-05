Commuter.Presenters.Departure = function(options) {
  var options = options ? options : {};
  this.model = options.model;
};

Commuter.Presenters.Departure.prototype.length = function() {
  var length = this.model.get('length');
  if(length = 8) {
    return 'An ' + length + ' car train';
  } else {
    return 'A ' + length + ' car train';
  }
};

Commuter.Presenters.Departure.prototype.minutes = function() {
  var minutes = this.model.get('minutes');
  if(minutes == 'Leaving') {
    return 'now';
  } else if(minutes == '1') {
    return 'in ' + minutes + ' minute';
  } else {
    return 'in ' + minutes + ' minutes';
  }
};
