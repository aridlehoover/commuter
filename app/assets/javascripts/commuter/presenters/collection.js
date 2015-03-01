Commuter.Presenters.Collection = function(options) {
  var options = options ? options : {};
  this.collection = options.collection;
  this.modelPresenter = options.modelPresenter;
};

Commuter.Presenters.Collection.prototype.models = function(){
  return _.map(this.collection.models, function(model) {
    return new this.modelPresenter({ model: model });
  }.bind(this));
};
