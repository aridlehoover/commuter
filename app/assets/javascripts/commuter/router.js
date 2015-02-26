Commuter.Router = Backbone.Router.extend({
  routes: {
    '': 'stations'
  },

  stations: function() {
    var collection = new Commuter.Collections.Stations();
    var view = new Commuter.Views.Stations({ collection: collection });
    collection.fetch();
  }
});
