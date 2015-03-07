Commuter = {
  Repository: {},
  Collections: {},
  Models: {},
  Presenters: {},
  Views: {}
};

$(document).ready(function() {
  this.router = new Commuter.Router();
  Backbone.history.start();
});
