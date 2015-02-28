Commuter.Router = Backbone.Router.extend({
  routes: {
    '': 'showStations'
  },

  showStations: function() {
    var collection = new Commuter.Collections.Stations();
    var view = new Commuter.Views.Stations({ collection: collection });
    collection.fetch();
  }
});
