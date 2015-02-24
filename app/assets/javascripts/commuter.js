Commuter = {
  Models: {},
  Collections: {},
  Views: {}
}

$(document).ready(function() {
  this.router = new Commuter.Router();
  Backbone.history.start();
});
