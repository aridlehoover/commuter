Commuter = {
  Collections: {},
  Models: {},
  Presenters: {},
  Repository: {},
  Views: {}
};

$(document).ready(function() {
  this.router = new Commuter.Router();
  Backbone.history.start();
});
